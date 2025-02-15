import 'package:flutter/material.dart';
import 'package:warraq/configs/routes/app_routes.dart';
import 'package:warraq/configs/theme/themes.dart';

class Warraq extends StatelessWidget {
  const Warraq({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routerConfig,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
