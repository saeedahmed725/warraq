import 'dart:async';
import 'dart:developer';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:warraq/configs/routes/app_routes.dart';

class SplashController extends Controller {
  final GoRouter router;

  SplashController(this.router) : super();

  @override
  void onInitState() {
    super.onInitState();
    Timer(const Duration(seconds: 3), () {
      log('SplashController: Navigating to OnBoardingScreen');
      router.go(AppRoutes.onBoarding);
    });
  }

  @override
  void initListeners() {
    /// listen for the controller animation in the future
  }
}
