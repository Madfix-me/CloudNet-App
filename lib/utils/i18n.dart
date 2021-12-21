import 'package:i18n_extension/io/import.dart';
import 'package:i18n_extension/i18n_extension.dart';

class MyI18n {
  static TranslationsByLocale translations = Translations.byLocale("de");

  static Future<void> loadTranslations() async {
    translations +=
    await JSONImporter().fromAssetDirectory("assets/locales");
  }
}