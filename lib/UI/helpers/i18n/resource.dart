import 'package:flutter/widgets.dart';

import 'package:demo/UI/helpers/i18n/en_usa.dart';
import 'package:demo/UI/helpers/i18n/translation.dart';

class ResourceTranslation {
  static Translation string = EnUsa();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default: string = EnUsa();
      break;
    }
  }
}