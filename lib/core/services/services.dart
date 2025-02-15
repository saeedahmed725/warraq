import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warraq/core/services/locator.dart';
import 'package:warraq/core/services/shared_prefs.dart';

class MyServices {
  MyServices._internal();

  static final MyServices instance = MyServices._internal();

  Future<MyServices> init() async {
    ServiceLocator.setup();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SharedPrefs.init();
    await Future.wait([  // is used to wait for multiple futures to complete
      dotenv.load(fileName: ".env"),
    ]);
    return this;
  }
}
