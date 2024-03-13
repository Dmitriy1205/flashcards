import 'package:bloc/bloc.dart';

enum LocaleEnum{
  english('English','en'),
  german('German','de'),
  italian('Italian','it'),
  french('French','fr');

  static LocaleEnum fromLanguageName(String languageName){
    return LocaleEnum.values.firstWhere((e) => e.languageName == languageName);
  }

  final String localeCode;
  final String languageName;
  const LocaleEnum(this.languageName, this.localeCode);
}
class LocaleCubit extends Cubit<LocaleEnum>{
  LocaleCubit() : super(LocaleEnum.english);

  void changeLang(LocaleEnum locale){
    emit(locale);
  }
}