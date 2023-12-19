import 'dart:ui';

class AppUtils{
  AppUtils._();

  static Locale? getLocaleFromLocaleName(String localeName){
    final localeInfo = localeName.split('_');
    if(localeInfo.length == 2){
      return Locale(localeInfo[0], localeInfo[1]);
    }
    return null;
  }
}