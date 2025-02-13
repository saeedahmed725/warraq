import 'package:flutter/material.dart';
import 'package:warraq/core/shared/arabic_responsive_text.dart';
import 'package:warraq/core/utils/errors/local_failure_content.dart';
import 'package:warraq/core/utils/errors/remote_failure_content.dart';

import 'failure.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.type == FailureType.local) {
      return LocalFailureContent(failure);
    }
    if (failure.type == FailureType.network ||
        failure.type == FailureType.firebase ||
        failure.type == FailureType.internal) {
      return RemoteFailureContent(failure);
    }

    return Center(child: ResponsiveText(text: failure.message, fontSize: 18));
  }
}
