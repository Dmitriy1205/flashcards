abstract class LocaleDb{
  Future<void> saveLang(String languageCode);
  Future<String> getLang();
}