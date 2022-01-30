import 'package:flutter/cupertino.dart';
import 'package:project/res/colors/app_colors.dart';
import 'package:project/res/dimentions/app_dimension.dart';
import 'package:project/res/strings/french_strings.dart';
import 'package:project/res/strings/strings.dart';

import 'strings/english_strings.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'fr':
        return FrenchStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
