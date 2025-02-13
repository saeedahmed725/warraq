import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:warraq/core/utils/errors/error_code.dart';
import 'package:warraq/core/utils/errors/failure.dart';

class LocalFailureContent extends StatelessWidget {
  const LocalFailureContent(this.failure, {super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.errorCode == LocalErrorCode.LOCTION_ERROR_CODE) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500.w,
              ),
              child: LottieBuilder.asset(
                'assets/images/error/no_gps.json',
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              failure.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () async => await Geolocator.openLocationSettings(),
              child: Text('To App Setting'),
            ),
          ],
        ),
      );
    }
    if (failure.errorCode == LocalErrorCode.DATABASE_ERROR_CODE) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500.w),
            child: LottieBuilder.asset('assets/images/error/database_error.json'),
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
    log(failure.toString());
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
