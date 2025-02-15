import 'package:flutter/material.dart';
import 'package:warraq/app/app.dart';
import 'package:warraq/core/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyServices.instance.init();
  runApp(const Warraq());
}
