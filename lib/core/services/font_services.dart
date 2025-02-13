import 'dart:async';

import 'package:flutter/services.dart';

class FontServices {
  static Future<void> initwarraqFonts() async {
    for (var index = 0; index < 604; index++) {
      await loadFontFromPath(
          'assets/fonts/warraq_fonts_qfc4/QCF4_${(index + 1).toString().padLeft(3, '0')}.woff',
          'P${index + 1}');
    }
  }

  static Future<void> loadFontFromPath(
      String fontPath, String fontFamily) async {
    try {
      // Load font file from assets using rootBundle
      final ByteData fontData = await rootBundle.load(fontPath);

      // Create a FontLoader and add the font
      final fontLoader = FontLoader(fontFamily)
        ..addFont(Future.value(ByteData.view(fontData.buffer)));

      // Load the font
      return await fontLoader.load();
    } catch (e) {
      throw Exception("Failed to load font: $e");
    }
  }
}
