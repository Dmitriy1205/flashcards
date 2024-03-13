import 'package:bloc/bloc.dart';

import '../../../domain/repositories/locale/locale_repository_contract.dart';

enum LocaleEnum{
  english('English','en'),
  german('German','de'),
  italian('Italian','it'),
  french('French','fr');

  static LocaleEnum fromLanguageName(String languageName){
    return LocaleEnum.values.firstWhere((e) => e.languageName == languageName);
  }

  static LocaleEnum fromLocaleCode(String localeCode){
    return LocaleEnum.values.firstWhere((e) => e.localeCode == localeCode);
  }

  final String localeCode;
  final String languageName;
  const LocaleEnum(this.languageName, this.localeCode);
}
class LocaleCubit extends Cubit<LocaleEnum>{
  final LocaleRepository _localeRepository;

  LocaleCubit({required LocaleRepository localeRepository}) :
        _localeRepository = localeRepository,
        super(LocaleEnum.english);

  void changeLang(LocaleEnum locale) async{
    await _localeRepository.saveLang(locale.localeCode);
    emit(locale);
  }

  void initLocale() async{
    final initialLocale = await _localeRepository.getLang();
    emit(LocaleEnum.fromLocaleCode(initialLocale));
  }
}