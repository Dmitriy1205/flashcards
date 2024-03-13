import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Map<String, Map<LocaleEnum, String>> _localizedExceptionsKeys = {
  'max-file-size-5mb': {
    LocaleEnum.english: "File is too big, maximum 5 mb",
    LocaleEnum.french: "Le fichier est trop gros, maximum 5 MB",
    LocaleEnum.italian: "Il file è troppo grande, massimo 5 MB",
    LocaleEnum.german: "Die Datei ist zu groß, maximal 5 MB"
  },
  'failed-upload-pdf': {
    LocaleEnum.english: "Failed to upload pdf",
    LocaleEnum.french: "Échec du téléchargement du fichier PDF",
    LocaleEnum.italian: "Caricamento del file PDF non riuscito",
    LocaleEnum.german: "PDF-Datei konnte nicht hochgeladen werden"
  },
  'failed-find-pdfs': {
    LocaleEnum.english: "Failed to find pdf files",
    LocaleEnum.french: "Impossible de trouver les fichiers PDF",
    LocaleEnum.italian: "Impossibile trovare i file PDF",
    LocaleEnum.german: "PDF-Dateien konnten nicht gefunden werden"
  },
  'user-already-exists': {
    LocaleEnum.english: "User with such email already exists",
    LocaleEnum.french: "Un utilisateur avec cette adresse e-mail existe déjà",
    LocaleEnum.italian: "Utente con questa email già esistente",
    LocaleEnum.german: "Benutzer mit dieser E-Mail existiert bereits"
  },
  'email-or-password-wrong': {
    LocaleEnum.english: "email or password is wrong",
    LocaleEnum.french: "L'e-mail ou le mot de passe est incorrect",
    LocaleEnum.italian: "Email o password sbagliata",
    LocaleEnum.german: "E-Mail oder Passwort ist falsch"
  },
  'user-disabled': {
    LocaleEnum.english: 'User corresponding to the given email has been disabled.',
    LocaleEnum.french: "L'utilisateur correspondant à l'e-mail donné a été désactivé.",
    LocaleEnum.italian: "L'utente corrispondente all'email fornita è stato disabilitato.",
    LocaleEnum.german: "Der Benutzer, der der angegebenen E-Mail entspricht, wurde deaktiviert."
  },
  'user-not-found': {
    LocaleEnum.english: 'There is no user corresponding to the given email',
    LocaleEnum.french: "Aucun utilisateur ne correspond à l'e-mail donné",
    LocaleEnum.italian: "Non esiste alcun utente corrispondente all'email fornita",
    LocaleEnum.german: "Es gibt keinen Benutzer, der der angegebenen E-Mail entspricht"
  },
  'account-exists-with-different-credential': {
    LocaleEnum.english: 'There already exists an account with the email address asserted by the credential',
    LocaleEnum.french: "Un compte existe déjà avec l'adresse e-mail affirmée par le jeton d'authentification",
    LocaleEnum.italian: "Esiste già un account con l'indirizzo email affermato dal credenziale",
    LocaleEnum.german: "Es existiert bereits ein Konto mit der E-Mail-Adresse, die durch das Anmeldeinformationen beansprucht wird"
  },
  'invalid-credential': {
    LocaleEnum.english: 'The credential is malformed or has expired',
    LocaleEnum.french: "Le jeton d'authentification est mal formé ou a expiré",
    LocaleEnum.italian: "Il token di autenticazione non è valido o è scaduto",
    LocaleEnum.german: "Das Anmeldeinformationen ist fehlerhaft oder abgelaufen"
  },
  'weak-password': {
    LocaleEnum.english: 'The password provided is too weak.\nmust be more than 6 digits',
    LocaleEnum.french: "Le mot de passe fourni est trop faible. Doit contenir plus de 6 chiffres",
    LocaleEnum.italian: "La password fornita è troppo debole.\ndeve contenere più di 6 cifre",
    LocaleEnum.german: "Das eingegebene Passwort ist zu schwach.\nEs müssen mehr als 6 Ziffern sein"
  },
  'email-already-in-use': {
    LocaleEnum.english: 'The account already exists for that email',
    LocaleEnum.french: "Le compte existe déjà pour cette adresse e-mail",
    LocaleEnum.italian: "L'account esiste già per quella email",
    LocaleEnum.german: "Das Konto existiert bereits für diese E-Mail-Adresse"
  },
};

class LocalizedException implements Exception {
  final String message;
  final String? localizationKey;
  final String? attribute;

  String localizedMessageOrDefault(BuildContext context) =>
      _localizedExceptionsKeys[localizationKey]
          ?[context.read<LocaleCubit>().state] ??
      message;

  LocalizedException({
    required this.message,
    this.localizationKey,
    this.attribute,
  });
}
