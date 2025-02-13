import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:warraq/core/shared/loading_widget.dart';
import 'package:warraq/core/utils/errors/failure.dart';
import 'package:warraq/core/utils/errors/failure_widget.dart';

/// ConditionFutureBuilder, ConditionBlocBuilder, ConditionStreamBuilder, ConditionBuilder
class ConditionBuilder<T> extends StatelessWidget {
  const ConditionBuilder(
      {super.key,
      required this.future,
      required this.builder,
      this.condition = true,
      this.onDone});

  final bool condition;
  final Widget Function(BuildContext context, T? data) builder;
  final Future<Result<T>> future;
  final void Function(T data)? onDone;

  @override
  Widget build(BuildContext context) {
    if (!condition) {
      log('ConditionBuilder: condition is false');
      return builder(context, null);
    }
    log('ConditionBuilder: condition is true');
    return FutureBuilder<Result<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return FailureWidget(
              failure: NetworkFailure(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          final result = snapshot.data!;
          return result.data.fold(
            (failure) => FailureWidget(
                failure: NetworkFailure(snapshot.error.toString())),
            (data) {
              onDone?.call(data);
              return builder(context, data);
            },
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
