import 'package:i18n_extension/i18n_extension.dart';
import 'package:i18n_extension/io/import.dart';

class MyI18n {
  static TranslationsByLocale translations = Translations.byLocale("de_DE");

  static Future<void> loadTranslations() async {
    translations +=
        await GettextImporter().fromAssetDirectory("assets/locales");
  }
}
