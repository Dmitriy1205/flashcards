import 'package:flashcards/data/local/locale/locale_db_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _langKey = 'lang';
const String _defaultLang = 'en';

class LocaleDbImpl implements LocaleDb{
  final SharedPreferences _sharedPreferences;

  @override
  Future<String> getLang() async => _sharedPreferences.getString(_langKey) ?? _defaultLang;

  @override
  Future<void> saveLang(String languageCode) => _sharedPreferences.setString(_langKey, languageCode);

  const LocaleDbImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;
}