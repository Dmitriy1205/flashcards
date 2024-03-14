import 'package:flashcards/data/local/locale/locale_db_contract.dart';
import 'package:flashcards/domain/repositories/locale/locale_repository_contract.dart';

class LocaleRepositoryImpl implements LocaleRepository{
  final LocaleDb _localeDb;

  @override
  Future<String> getLang() => _localeDb.getLang();

  @override
  Future<void> saveLang(String languageCode) => _localeDb.saveLang(languageCode);

  const LocaleRepositoryImpl({
    required LocaleDb localeDb,
  }) : _localeDb = localeDb;
}