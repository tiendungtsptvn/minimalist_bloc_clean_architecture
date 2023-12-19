// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "home": "Home",
  "calendar": "Calendar",
  "focuses": "Focuses",
  "profile": "Profile"
};
static const Map<String,dynamic> vi_VN = {
  "home": "Trang chủ",
  "calendar": "Lịch",
  "focuses": "Tập trung",
  "profile": "Hồ sơ"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "vi_VN": vi_VN};
}
