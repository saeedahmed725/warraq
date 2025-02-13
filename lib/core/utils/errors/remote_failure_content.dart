import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:warraq/core/utils/errors/error_code.dart';
import 'package:warraq/core/utils/errors/failure.dart';

class RemoteFailureContent extends StatelessWidget {
  const RemoteFailureContent(this.failure, {super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.errorCode == RemoteErrorCode.INTERNET_ERROR_CODE) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500.w,
              ),
              child: ClipOval(
                child: LottieBuilder.asset(
                  'assets/images/error/no_internet.json',
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              failure.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500.w,
          ),
          child: LottieBuilder.asset(
            'assets/images/error/general_error.json',
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          failure.message,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
