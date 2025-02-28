import '../../core/utils/helpers/shared_pref_helper.dart';

class ThemeCacheHelper {
  static void getThemeCache() {
    final themeIndex = SharedPrefHelper.getInt("THEME_INDEX");
    if (themeIndex != null) {
    } else {}
  }
}
