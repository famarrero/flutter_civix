/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get contactenosFgr =>
      const AssetGenImage('assets/images/contactenos_fgr.png');
  AssetGenImage get contactenosOnbc =>
      const AssetGenImage('assets/images/contactenos_onbc.jpg');
  AssetGenImage get contactenosTsp =>
      const AssetGenImage('assets/images/contactenos_tsp.jpg');
  AssetGenImage get icoCivixImagenLetras =>
      const AssetGenImage('assets/images/ico_civix_imagen_letras.png');
  AssetGenImage get icoCivixImagenLetrasContorneado => const AssetGenImage(
      'assets/images/ico_civix_imagen_letras_contorneado.png');
  AssetGenImage get logoAgr =>
      const AssetGenImage('assets/images/logo_agr.png');
  AssetGenImage get logoAnpp =>
      const AssetGenImage('assets/images/logo_anpp.png');
  AssetGenImage get logoCegel =>
      const AssetGenImage('assets/images/logo_cegel.png');
  AssetGenImage get logoFgr =>
      const AssetGenImage('assets/images/logo_fgr.png');
  AssetGenImage get logoInder =>
      const AssetGenImage('assets/images/logo_inder.jpg');
  AssetGenImage get logoIpf =>
      const AssetGenImage('assets/images/logo_ipf.png');
  AssetGenImage get logoMes =>
      const AssetGenImage('assets/images/logo_mes.png');
  AssetGenImage get logoMined =>
      const AssetGenImage('assets/images/logo_mined.png');
  AssetGenImage get logoMinjus =>
      const AssetGenImage('assets/images/logo_minjus.png');
  AssetGenImage get logoOnat =>
      const AssetGenImage('assets/images/logo_onat.png');
  AssetGenImage get logoOnbc =>
      const AssetGenImage('assets/images/logo_onbc.png');
  AssetGenImage get logoTsp =>
      const AssetGenImage('assets/images/logo_tsp.png');
  AssetGenImage get logoUci =>
      const AssetGenImage('assets/images/logo_uci.png');
  AssetGenImage get marcaAguaFgr =>
      const AssetGenImage('assets/images/marca_agua_fgr.png');
  AssetGenImage get marcaAguaOnbc =>
      const AssetGenImage('assets/images/marca_agua_onbc.png');
  AssetGenImage get marcaAguaTsp =>
      const AssetGenImage('assets/images/marca_agua_tsp.png');
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  $AssetsJsonsCivixGen get civix => const $AssetsJsonsCivixGen();
  $AssetsJsonsFgrGen get fgr => const $AssetsJsonsFgrGen();
  $AssetsJsonsGeneralGen get general => const $AssetsJsonsGeneralGen();
  $AssetsJsonsOnbcGen get onbc => const $AssetsJsonsOnbcGen();
  $AssetsJsonsTspGen get tsp => const $AssetsJsonsTspGen();
}

class $AssetsJsonsCivixGen {
  const $AssetsJsonsCivixGen();

  String get faqCivix => 'assets/jsons/civix/faq_civix.json';
}

class $AssetsJsonsFgrGen {
  const $AssetsJsonsFgrGen();

  String get contactUsFgr => 'assets/jsons/fgr/contact_us_fgr.json';
  String get dependencyFgr => 'assets/jsons/fgr/dependency_fgr.json';
  String get faqFgr => 'assets/jsons/fgr/faq_fgr.json';
  String get historyFgr => 'assets/jsons/fgr/history_fgr.json';
  String get missionAndFunctionsFgr =>
      'assets/jsons/fgr/mission_and_functions_fgr.json';
  String get structureFgr => 'assets/jsons/fgr/structure_fgr.json';
}

class $AssetsJsonsGeneralGen {
  const $AssetsJsonsGeneralGen();

  String get provinces => 'assets/jsons/general/provinces.json';
}

class $AssetsJsonsOnbcGen {
  const $AssetsJsonsOnbcGen();

  String get contactUsOnbc => 'assets/jsons/onbc/contact_us_onbc.json';
  String get dependencyOnbc => 'assets/jsons/onbc/dependency_onbc.json';
  String get faqOnbc => 'assets/jsons/onbc/faq_onbc.json';
  String get historyOnbc => 'assets/jsons/onbc/history_onbc.json';
  String get missionAndVisionOnbc =>
      'assets/jsons/onbc/mission_and_vision_onbc.json';
}

class $AssetsJsonsTspGen {
  const $AssetsJsonsTspGen();

  String get contactUsTsp => 'assets/jsons/tsp/contact_us_tsp.json';
  String get courtRoomsTsp => 'assets/jsons/tsp/court_rooms_tsp.json';
  String get dependencyTsp => 'assets/jsons/tsp/dependency_tsp.json';
  String get faqTsp => 'assets/jsons/tsp/faq_tsp.json';
  String get historyTsp => 'assets/jsons/tsp/history_tsp.json';
  String get missionAndVisionTsp =>
      'assets/jsons/tsp/mission_and_vision_tsp.json';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
