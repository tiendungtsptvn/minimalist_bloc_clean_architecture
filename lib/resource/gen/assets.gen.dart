/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add_icon.svg
  SvgGenImage get addIcon => const SvgGenImage('assets/images/add_icon.svg');

  /// File path: assets/images/calendar_icon.svg
  SvgGenImage get calendarIcon => const SvgGenImage('assets/images/calendar_icon.svg');

  /// File path: assets/images/camera_icon.svg
  SvgGenImage get cameraIcon => const SvgGenImage('assets/images/camera_icon.svg');

  /// File path: assets/images/clock_icon.svg
  SvgGenImage get clockIcon => const SvgGenImage('assets/images/clock_icon.svg');

  /// File path: assets/images/flash_icon.svg
  SvgGenImage get flashIcon => const SvgGenImage('assets/images/flash_icon.svg');

  /// File path: assets/images/home_icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/images/home_icon.svg');

  /// File path: assets/images/info_circle_icon.svg
  SvgGenImage get infoCircleIcon => const SvgGenImage('assets/images/info_circle_icon.svg');

  /// File path: assets/images/key_icon.svg
  SvgGenImage get keyIcon => const SvgGenImage('assets/images/key_icon.svg');

  /// File path: assets/images/like_icon.svg
  SvgGenImage get likeIcon => const SvgGenImage('assets/images/like_icon.svg');

  /// File path: assets/images/logout_icon.svg
  SvgGenImage get logoutIcon => const SvgGenImage('assets/images/logout_icon.svg');

  /// File path: assets/images/menu_icon.svg
  SvgGenImage get menuIcon => const SvgGenImage('assets/images/menu_icon.svg');

  /// File path: assets/images/setting_icon.svg
  SvgGenImage get settingIcon => const SvgGenImage('assets/images/setting_icon.svg');

  /// File path: assets/images/user_icon.svg
  SvgGenImage get userIcon => const SvgGenImage('assets/images/user_icon.svg');

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
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
