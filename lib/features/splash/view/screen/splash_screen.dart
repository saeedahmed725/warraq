import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:warraq/configs/routes/app_routes.dart';
import 'package:warraq/features/splash/view/controller/splash_controller.dart';

class SplashScreen extends CleanView {
  const SplashScreen({super.key});

  @override
  State<CleanView> createState() => SplashState();
}

class SplashState extends ResponsiveViewState<SplashScreen, SplashController> {
  SplashState() : super(SplashController(AppRoutes.routerConfig));

  Widget appScaffold({required Widget child}) {
    return Scaffold(
      key: globalKey,
      body: Center(child: child),
    );
  }

  @override
  Widget get mobileView => appScaffold(child: const Text('Splash Screen'));

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
