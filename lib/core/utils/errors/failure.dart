import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:warraq/core/utils/errors/error_code.dart';
import 'package:warraq/core/utils/errors/exceptions.dart';

abstract class Failure {
  final String message;
  final FailureType type;
  final int? errorCode;

  const Failure(this.message, this.type, {this.errorCode});

  static Future<Result<T>> handleOperation<T>({
    required Future<T> Function() operation,
    required String errorMessage,
  }) async {
    try {
      final result = await operation();
      return Result.success(result);
    } on InternetException catch (error) {
      return Result.error(NetworkFailure.fromInternetError(error));
    } on DioException catch (error) {
      return Result.error(NetworkFailure.fromDioError(error));
    } on LocalException catch (error) {
      return Result.error(LocalFailure(error.message));
    } catch (e) {
      log(e.toString());
      return Result.error(NetworkFailure(errorMessage));
    }
  }

  static Stream<Result<T>> handleStreamOperation<T>({
    required Future<T> Function() operation,
    required String errorMessage,
  }) async* {
    try {
      final result = await operation();
      yield Result.success(result);
    } on InternetException catch (error) {
      yield Result.error(NetworkFailure.fromInternetError(error));
    } on DioException catch (error) {
      yield Result.error(NetworkFailure.fromDioError(error));
    } on LocalException catch (error) {
      yield Result.error(LocalFailure(error.message));
    } catch (e) {
      log(e.toString());
      yield Result.error(NetworkFailure(errorMessage));
    }
  }
}

enum FailureType {
  network,
  internal,
  firebase,
  local,
}

class Result<T> {
  final Either<Failure, T> data;

  Result({required this.data});

  Result.success(T value) : data = Right(value);

  Result.error(Failure failure) : data = Left(failure);

  bool get isSuccess => data.isRight();

  bool get isFailure => data.isLeft();

  B fold<B>(
      {required B Function(Failure failure) onFailure,
      required B Function(T data) onSuccess}) {
    return data.fold(onFailure, onSuccess);
  }
}

// Represent failures from Network.
class NetworkFailure extends Failure {
  NetworkFailure(String message,
      {int? code = RemoteErrorCode.INTERNET_ERROR_CODE})
      : super(
          message,
          FailureType.network,
          errorCode: code,
        );

  factory NetworkFailure.fromInternetError(InternetException exception) {
    return NetworkFailure('No Internet Connection', code: exception.code);
  }

  factory NetworkFailure.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return NetworkFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return NetworkFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return NetworkFailure.fromResponse(
            exception.response!.statusCode, exception.response!.data);
      case DioExceptionType.cancel:
        return NetworkFailure('Request to ApiServer was canceled');

      case DioExceptionType.badCertificate:
        if (exception.message.toString().contains('SocketException')) {
          return NetworkFailure('No Internet Connection');
        }
        return NetworkFailure('Unexpected Error, Please try again!');
      default:
        return NetworkFailure('Apps There was an Error, Please try again');
    }
  }

  factory NetworkFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return NetworkFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return NetworkFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return NetworkFailure('Internal Server error, Please try later');
    } else {
      return NetworkFailure('Ops There was an Error, Please try again');
    }
  }
}

// Represent failures from Cache.
class LocalFailure extends Failure {
  const LocalFailure(String message, {int? code})
      : super(message, FailureType.local, errorCode: code);

  factory LocalFailure.fromIoException(Exception exception) {
    if (exception is FileSystemException) {
      return LocalFailure('File System Error: ${exception.message}',
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    } else if (exception is FormatException) {
      return LocalFailure('Data format error: ${exception.message}',
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    } else if (exception is LocalException) {
      return LocalFailure('Local Exception error: ${exception.message}',
          code: exception.code);
    } else {
      return LocalFailure('Unexpected Local Error: ${exception.toString()}',
          code: LocalErrorCode.DATABASE_ERROR_CODE);
    }
  }

  @override
  String toString() {
    return 'LocalFailure: $message';
  }
}

// Represent failures from Firebase.
class FireBaseFailure extends Failure {
  final String code;
  final String? extraInfo;

  const FireBaseFailure({
    required message,
    required this.code,
    this.extraInfo,
  }) : super(message, FailureType.firebase);

  factory FireBaseFailure.fromMessage({required String message}) {
    return FireBaseFailure(message: message, code: '');
  }

  factory FireBaseFailure.fromFacebookMessage({required String providers}) {
    if (providers.contains('google')) {
      // Account is linked with Google
      return const FireBaseFailure(
        message:
            'An account already exists with the same email address but different sign-in credentials. Please sign in using Google.',
        code: '',
      );
    } else if (providers.contains('password')) {
      // Account is linked with Email/Password
      return const FireBaseFailure(
        message:
            'An account already exists with the same email address but different sign-in credentials. Please sign in using email and password.',
        code: '',
      );
    } else {
      // Other provider linked
      return const FireBaseFailure(
        message:
            'An account already exists with a different sign-in method. Use another method associated with this email address.',
        code: '',
      );
    }
  }

  factory FireBaseFailure.fromCodeError(
      {required String? message, required String code}) {
    log(code);
    // log(message?? 'message is null') ;
    String message = 'Couldn\'t sign up';
    switch (code) {
      case 'email-already-in-use':
        message = 'Email already in use, Please pick another email!';
        break;
      case 'invalid-email':
        message = 'Enter valid e-mail';
        break;
      case 'operation-not-allowed':
        message = 'Email/password accounts are not enabled';
        break;
      case 'weak-password':
        message = 'Password must be more than 5 characters';
        break;
      case 'too-many-requests':
        message = 'Too many requests, Please try again later.';
        break;
      case 'user-disabled':
        message = 'This account has been disabled';
        break;
      case 'user-not-found':
        message = 'User not found';
        break;
      case 'invalid-credential':
        message = 'Invalid email or password';
        break;

      default:
        message = 'Couldn\'t sign up';
    }
    return FireBaseFailure(message: message, code: code);
  }
}
