import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApis {
  AppApis._();

  static String baseUrl = dotenv.env['BASE_URL'] as String;
  static String baseDownloadUrl = dotenv.env['DATABASE_LINK'] as String;
  static const String login = '/auth/login';
  static const String register = '/auth/signup';
  static const String getOtp = '/otp';
  static const String verifyOtp = '/verify-otp';
  static const String resetPassword = '/reset-password';
  static const String changePassword = '/auth/password/update';
  static const String getChats = '/chat/get_user_session';
  static const String getChat = '/chat/get_chat_details';
  static const String sendMessage = '/chat/send_message';
  static const String createChat = '/chat/create_session';
  static const String getwarraq = '/warraq';
  static const String getAzkar = '/azkar';
  static const String getPrayerTimes = '/prayer-times';
  static const String getActivities = '/activities';
  static const String getFavorites = '/favorites';
  static const String getProfile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String getSettings = '/settings';
  static const String updateSettings = '/update-settings';
  static const String getAbout = '/about';
  static const String getNotifications = '/notifications';
  static const String logout = '/logout';
  static const String deleteAccount = '/delete-account';
  static const String getSurah = '/surah';
  static const String getSurahs = '/surahs';
  static const String getAyah = '/ayah';
  static const String getAyahs = '/ayahs';
  static const String getHadith = '/hadith';
  static const String getHadiths = '/hadiths';
  static const String getDua = '/dua';
  static const String getDuas = '/duas';
  static const String getPrayer = '/prayer';
  static const String getPrayers = '/prayers';
  static const String getPrayerTime = '/prayer-time';

  // static String getChat(String chatId) => '/chat/$chatId';

  static String getFavorite(String favoriteId) => '/favorite/$favoriteId';

  static String getAzkarCategory(String categoryId) => '/azkar/$categoryId';

  static String getPrayerTimeByCity(String city) => '/prayer-times/$city';

  static String getActivity(String activityId) => '/activities/$activityId';

  static String getNotification(String notificationId) =>
      '/notifications/$notificationId';

  static String getSurahById(String surahId) => '/surah/$surahId';

  static String getAyahById(String ayahId) => '/ayah/$ayahId';

  static String getHadithById(String hadithId) => '/hadith/$hadithId';

  static String getDuaById(String duaId) => '/dua/$duaId';

  static String getPrayerById(String prayerId) => '/prayer/$prayerId';

  static String getPrayerTimeByCityAndDate(String city, String date) =>
      '/prayer-times/$city/$date';

  static String updateProfileById(String profileId) =>
      '/update-profile/$profileId';

  static String updateSettingsById(String settingsId) =>
      '/update-settings/$settingsId';

  static String updateNotificationById(String notificationId) =>
      '/update-notification/$notificationId';

  static String updateSurahById(String surahId) => '/update-surah/$surahId';

  static String updateAyahById(String ayahId) => '/update-ayah/$ayahId';

  static String updateHadithById(String hadithId) => '/update-hadith/$hadithId';

  static String updateDuaById(String duaId) => '/update-dua/$duaId';

  static String updatePrayerById(String prayerId) => '/update-prayer/$prayerId';

  static String updatePrayerTimeById(String prayerTimeId) =>
      '/update-prayer-time/$prayerTimeId';

  static String deleteChat(String chatId) => '/delete-chat/$chatId';

  static String deleteFavorite(String favoriteId) =>
      '/delete-favorite/$favoriteId';

  static String deleteAzkarCategory(String categoryId) =>
      '/delete-azkar/$categoryId';

  static String deletePrayerTimeByCity(String city) =>
      '/delete-prayer-times/$city';

  static String deleteActivity(String activityId) =>
      '/delete-activities/$activityId';

  static String deleteNotification(String notificationId) =>
      '/delete-notifications/$notificationId';

  static String deleteSurahById(String surahId) => '/delete-surah/$surahId';

  static String deleteAyahById(String ayahId) => '/delete-ayah/$ayahId';

  static String deleteHadithById(String hadithId) => '/delete-hadith/$hadithId';

  static String deleteDuaById(String duaId) => '/delete-dua/$duaId';

  static String deletePrayerById(String prayerId) => '/delete-prayer/$prayerId';

  static String deletePrayerTimeById(String prayerTimeId) =>
      '/delete-prayer-time/$prayerTimeId';
}
