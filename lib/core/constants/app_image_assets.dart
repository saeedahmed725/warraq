class AppImageAssets {
  AppImageAssets._();

  // global image
  static const String logoImage = 'assets/images/logo.png';
  static const String splashImage = 'assets/images/splash/splash.png';
  /// background
  static const String aqsaBackgroundImage = 'assets/images/background/aqsa.jpg';
  static const String nakshBackgroundImage = 'assets/images/background/naksh.jpg';
  static const String bismalih = 'assets/images/icons/bismalih.png';

  // category

  // icons
  static const String qaabahIcon = 'assets/images/icons/qaabah.svg';
  static const String bookmarkSvg = 'assets/images/icons/bookmark.svg';
  static const String bookLastReadingSvg =
      'assets/images/icons/book_last_reading.svg';
  static const String basmalaSvg = 'assets/images/icons/basmala.svg';
  static const String basmala2Svg = 'assets/images/icons/besmAllah.svg';
  static const String basmala3Svg = 'assets/images/icons/besmAllah2.svg';
  static const String surahHeaderSvg = 'assets/images/icons/ic_soura_name.svg';
  static const String surahHeader1Svg =
      'assets/images/icons/ic_soura_name_1.svg';
  static const String pageFrameBoxBlueSvg =
      'assets/images/icons/page_frame_box_blue.svg';
  static const String pageFrameBoxGreenSvg =
      'assets/images/icons/page_frame_box_green.svg';
  static const String hHalfSvg = 'assets/images/icons/hhalf.svg';
  static const String hJuzEhezbSvg = 'assets/images/icons/hjuzehezb.svg';
  static const String hPartySvg = 'assets/images/icons/hparty.svg';
  static const String hQuarterSvg = 'assets/images/icons/hquarter.svg';
  static const String hThreeQuarterSvg =
      'assets/images/icons/hthreequarter.svg';
  static const String icAyahNoSvg = 'assets/images/icons/ic_aya_no.svg';
  static const String icPageLeftSvg = 'assets/images/icons/ic_page_left.svg';
  static const String icRightLeftSvg = 'assets/images/icons/ic_page_right.svg';
  static const String borderNoIcon = 'assets/images/icons/border_no.svg';
  static const String spaceLineIcon = 'assets/images/icons/space_line.svg';
  static const String lineIcon = 'assets/images/icons/line.svg';
  static const String line2Icon = 'assets/images/icons/line2.svg';
  static const String menuLineIcon = 'assets/images/icons/menu.svg';
  static const String threeDotsIcon = 'assets/images/icons/three_dots.png';
  static const String tafsirIcon = 'assets/images/icons/tafsir_icon.svg';
  static const String tafsir2Icon = 'assets/images/icons/tafsir2_icon.svg';
  static const String tafsir3Icon = 'assets/images/icons/tafsir3_icon.svg';
  static const String clipboardIcon = 'assets/images/icons/clipboard.svg';
  static const String closeIcon = 'assets/images/icons/close.svg';
  static const String downloadIcon = 'assets/images/icons/download.svg';
  static const String settingsSolidIcon =
      'assets/images/icons/setting-solid-icon.svg';
  static const String settingsOutlinedIcon =
      'assets/images/icons/setting-outlined-icon.svg';
  static const String chatbotOutlinedIcon =
      'assets/images/icons/chatbot-outlined-icon.svg';
  static const String chatbotSolidIcon =
      'assets/images/icons/chatbot-solid-icon.svg';
  static const String statisticsOutlinedIcon =
      'assets/images/icons/statistics-outlined-icon.svg';
  static const String statisticsSolidIcon =
      'assets/images/icons/statistics-solid-icon.svg';
  static const String profileOutlinedIcon =
      'assets/images/icons/profile-outlined-icon.svg';
  static const String profileSolidIcon =
      'assets/images/icons/profile-solid-icon.svg';
  static const String heartOutlinedIcon =
      'assets/images/icons/heart-regular.svg';
  static const String heartSolidIcon = 'assets/images/icons/heart-solid.svg';
  static const String playIcon = 'assets/images/icons/play.svg';
  static const String searchIcon = 'assets/images/icons/search.svg';
  static const String shareIcon = 'assets/images/icons/share.svg';
  static const String bookmarkSolidIcon =
      'assets/images/icons/bookmark-solid.svg';
  static const String bookmarkOutlinedIcon =
      'assets/images/icons/bookmark-regular.svg';
  static const String sendMessageIcon = 'assets/images/icons/send_message.svg';
  static const String mandalaIcon = 'assets/images/icons/mandala.svg';
  static const String mosqueIcon = 'assets/images/icons/mosque-icon.svg';

  /// png images
  static const String starsIconsBackground =
      'assets/images/png/stars-icons.png';
  static const String lastReadingAvatar =
      'assets/images/png/last-reading-avatar.png';
  static const String lastReadingBackground =
      'assets/images/png/last-reading-background.png';

  /// prayer times
  static const String fajirImage = 'assets/images/prayer_time/icon/fajir.svg';
  static const String sunRiseImage =
      'assets/images/prayer_time/icon/sunrise.svg';
  static const String thohaerImage =
      'assets/images/prayer_time/icon/thohaer.svg';
  static const String asserImage = 'assets/images/prayer_time/icon/asser.svg';
  static const String maghrabImage =
      'assets/images/prayer_time/icon/sunset.svg';
  static const String ashaaImage = 'assets/images/prayer_time/icon/moon.svg';

  static String getPrayerImage(int index) {
    return [
      fajirImage,
      sunRiseImage,
      thohaerImage,
      asserImage,
      maghrabImage,
      ashaaImage,
    ][index];
  }

  static String getSurahImage(int surahNumber) {
    return 'assets/images/surah/00$surahNumber.svg';
  }

  static String getJuzImage(int juzNumber) {
    return 'assets/images/juz/$juzNumber.svg';
  }
}
