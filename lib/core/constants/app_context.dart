import 'package:flutter/cupertino.dart';

class AppContext {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState!.overlay!.context;
}