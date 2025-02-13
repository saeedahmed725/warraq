class AppJsonAndImage {
  AppJsonAndImage();
  static String? surahPageNumberPath;
  static String? surahPagePath;
  static String? surahName;

  static String duaJson = 'assets/json/dua_list.json';

 static String getSurahFileName({required String surahNumber}) {
    surahName = 'assets/warraq Suras/surah_$surahNumber.json';
    return surahName!;
  }

  ({String surahPageNumber, String surahPagePath}) getImageFileName(
      {required int surahPageNumber}) {
    surahPageNumberPath = 'assets/pages/00$surahPageNumber.png';
    surahPagePath = 'assets/pages/000$surahPageNumber.png';
    return (
      surahPageNumber: surahPageNumberPath!,
      surahPagePath: surahPagePath!
    );
  }
}
