// dart format width=100

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Lato-Black.ttf
  String get latoBlack => 'assets/fonts/Lato-Black.ttf';

  /// File path: assets/fonts/Lato-BlackItalic.ttf
  String get latoBlackItalic => 'assets/fonts/Lato-BlackItalic.ttf';

  /// File path: assets/fonts/Lato-Bold.ttf
  String get latoBold => 'assets/fonts/Lato-Bold.ttf';

  /// File path: assets/fonts/Lato-BoldItalic.ttf
  String get latoBoldItalic => 'assets/fonts/Lato-BoldItalic.ttf';

  /// File path: assets/fonts/Lato-Italic.ttf
  String get latoItalic => 'assets/fonts/Lato-Italic.ttf';

  /// File path: assets/fonts/Lato-Light.ttf
  String get latoLight => 'assets/fonts/Lato-Light.ttf';

  /// File path: assets/fonts/Lato-LightItalic.ttf
  String get latoLightItalic => 'assets/fonts/Lato-LightItalic.ttf';

  /// File path: assets/fonts/Lato-Regular.ttf
  String get latoRegular => 'assets/fonts/Lato-Regular.ttf';

  /// File path: assets/fonts/Lato-Thin.ttf
  String get latoThin => 'assets/fonts/Lato-Thin.ttf';

  /// File path: assets/fonts/Lato-ThinItalic.ttf
  String get latoThinItalic => 'assets/fonts/Lato-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        latoBlack,
        latoBlackItalic,
        latoBold,
        latoBoldItalic,
        latoItalic,
        latoLight,
        latoLightItalic,
        latoRegular,
        latoThin,
        latoThinItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/solid
  $AssetsImagesSolidGen get solid => const $AssetsImagesSolidGen();
}

class $AssetsLanguagesGen {
  const $AssetsLanguagesGen();

  /// File path: assets/languages/en-US.json
  String get enUS => 'assets/languages/en-US.json';

  /// File path: assets/languages/vi-VN.json
  String get viVN => 'assets/languages/vi-VN.json';

  /// List of all assets
  List<String> get values => [enUS, viVN];
}

class $AssetsImagesSolidGen {
  const $AssetsImagesSolidGen();

  /// File path: assets/images/solid/add_icon.svg
  SvgGenImage get addIcon =>
      const SvgGenImage('assets/images/solid/add_icon.svg');

  /// File path: assets/images/solid/calendar_icon.svg
  SvgGenImage get calendarIcon =>
      const SvgGenImage('assets/images/solid/calendar_icon.svg');

  /// File path: assets/images/solid/camera_icon.svg
  SvgGenImage get cameraIcon =>
      const SvgGenImage('assets/images/solid/camera_icon.svg');

  /// File path: assets/images/solid/clock_icon.svg
  SvgGenImage get clockIcon =>
      const SvgGenImage('assets/images/solid/clock_icon.svg');

  /// File path: assets/images/solid/flash_icon.svg
  SvgGenImage get flashIcon =>
      const SvgGenImage('assets/images/solid/flash_icon.svg');

  /// File path: assets/images/solid/home_icon.svg
  SvgGenImage get homeIcon =>
      const SvgGenImage('assets/images/solid/home_icon.svg');

  /// File path: assets/images/solid/info_circle_icon.svg
  SvgGenImage get infoCircleIcon =>
      const SvgGenImage('assets/images/solid/info_circle_icon.svg');

  /// File path: assets/images/solid/key_icon.svg
  SvgGenImage get keyIcon =>
      const SvgGenImage('assets/images/solid/key_icon.svg');

  /// File path: assets/images/solid/like_icon.svg
  SvgGenImage get likeIcon =>
      const SvgGenImage('assets/images/solid/like_icon.svg');

  /// File path: assets/images/solid/logout_icon.svg
  SvgGenImage get logoutIcon =>
      const SvgGenImage('assets/images/solid/logout_icon.svg');

  /// File path: assets/images/solid/menu_icon.svg
  SvgGenImage get menuIcon =>
      const SvgGenImage('assets/images/solid/menu_icon.svg');

  /// File path: assets/images/solid/setting_icon.svg
  SvgGenImage get settingIcon =>
      const SvgGenImage('assets/images/solid/setting_icon.svg');

  /// File path: assets/images/solid/user_icon.svg
  SvgGenImage get userIcon =>
      const SvgGenImage('assets/images/solid/user_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        addIcon,
        calendarIcon,
        cameraIcon,
        clockIcon,
        flashIcon,
        homeIcon,
        infoCircleIcon,
        keyIcon,
        likeIcon,
        logoutIcon,
        menuIcon,
        settingIcon,
        userIcon
      ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLanguagesGen languages = $AssetsLanguagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
