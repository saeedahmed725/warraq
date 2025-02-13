// ignore_for_file: constant_identifier_names

import 'package:flutter/gestures.dart';

typedef LongPressStartDetailsFunction = void Function(LongPressStartDetails)?;

enum TimingProps {
  Fajr,
  Dhuhr,
  Asr,
  Maghrib,
  Isha,
}
class AppStatic {
  static List<String> listOfIcons = [];
  static const int GLYPH_TYPE_WORD = 1;
  static const int GLYPH_TYPE_AYAH_NUMBER = 2;
  static const int GLYPH_TYPE_MARKS = 3; // (مثل علامات الوقف)
  static const int GLYPH_TYPE_RUBA = 4;
  static const int GLYPH_TYPE_SAJDAH = 5;
  static const int GLYPH_TYPE_SURAH = 6; // ex: (الفاتحة، الناس)
// static const int GLYPH_TYPE_SURAH_WORD = 7; // (word_سورة)
  static const int GLYPH_TYPE_BISM_ALLAH = 8;
}
