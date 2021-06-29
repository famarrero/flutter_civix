import 'package:flutter/material.dart';

///////Civix colors///////
const kCivixPrimaryColor = Color(0xff055bab);
const kCivixSecondaryColor = Color(0xff1A73C6);

///////FGR colors///////
//0xff151a2e original
const kFgrPrimary = 0xff242c4e;
const kFgrPrimaryColor = Color(0xff242c4e);
const MaterialColor kFgrPrimaryMaterialColor = MaterialColor(
  kFgrPrimary,
  <int, Color>{
    50: Color(0xff5e75c7),
    100: Color(0xff5064aa),
    200: Color(0xff42538d),
    300: Color(0xff323f6c),
    400: Color(0xff232c4c),
    500: Color(kFgrPrimary),
    600: Color(0xff1c2340),
    700: Color(0xff161c34),
    800: Color(0xff101528),
    900: Color(0xff0f1428),
  },
);

const kFgrSecondary = 0xff303b68;
const kFgrSecondaryColor = Color(0xff303b68);
const MaterialColor kFgrSecondaryMaterialColor = MaterialColor(
  kFgrPrimary,
  <int, Color>{
    50: Color(0xff5a6fc6),
    100: Color(0xff4c5ea8),
    200: Color(0xff435293),
    300: Color(0xff3a477f),
    400: Color(0xff313c6a),
    500: Color(kFgrSecondary),
    600: Color(0xff293258),
    700: Color(0xff232b4b),
    800: Color(0xff1c223b),
    900: Color(0xff131728),
  },
);

///////TSP colors///////
const kTspPrimaryColor = Color(0xff6a1623);
const kTspSecondaryColor = Color(0xff892736);

///////ONBC colors///////
const kOnbcPrimaryColor = Color(0xffb80000);
const kOnbcSecondaryColor = Color(0xffbf3737);
