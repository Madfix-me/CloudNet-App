import 'package:cloudnet_v3_flutter/utils/i18n.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, MyI18n.translations);
  String plural(int value) => localizePlural(value, this, MyI18n.translations);
  String fill(List<Object> params) => localizeFill(this, params);
}