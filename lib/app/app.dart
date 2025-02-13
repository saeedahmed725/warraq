import 'package:flutter/material.dart';
import 'package:warraq/core/constants/app_context.dart';

class Warraq extends StatelessWidget {
  const Warraq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppContext.navigatorKey,

    );
  }
}
