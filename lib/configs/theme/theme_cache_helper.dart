import 'package:warraq/core/services/shared_prefs.dart';

class ThemeCacheHelper {
  static void getThemeCache() {
    final themeIndex = SharedPrefs.getInt("THEME_INDEX");
    if (themeIndex != null) {
    } else {}
  }
}
