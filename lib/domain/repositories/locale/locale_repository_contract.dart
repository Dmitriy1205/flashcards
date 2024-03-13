abstract class LocaleRepository{
  Future<void> saveLang(String languageCode);
  Future<String> getLang();
}