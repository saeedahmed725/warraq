import 'package:go_router/go_router.dart';
import 'package:warraq/core/constants/app_context.dart';
import 'package:warraq/features/splash/view/screen/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String register = "/register";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String resetPassword = "/resetPassword";
  static const String otp = "/otp";
  static const String verification = "/verification";
  static const String pickUpFavorite = "/pickUpFavorite";
  static const String home = "/home";

  static final routerConfig = GoRouter(
    initialLocation: splash,
    navigatorKey: AppContext.navigatorKey,
    routes: [
      GoRoute(
        name: splash,
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      // path: onBoarding,
      // builder: (context, state) => const OnBoardingScreen(),
      // ),
      // ToDo: Add OnBoardingScreen mo_ashraf07  when splash screen is done the app navigation will be to onBoardingScreen
    ],
  );
}
