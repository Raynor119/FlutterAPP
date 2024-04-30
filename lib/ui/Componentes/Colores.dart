import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color coloarPrimario = Color(0xFF0098DF);
const Color coloarPrimarioDark = Color(0xFF0058A0);
const Color coloaracento = Color(0xFF002A79);

const int _bluePrimaryValue = 0xFF0098DF;
const int _bluePrimaryValueDark = 0xFF0058A0;

const Color negrototal = Color(0xFF000000);
const MaterialColor blueTheme = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: coloarPrimario,
    200: coloarPrimario,
    300: coloarPrimario,
    400: coloarPrimario,
    500: coloarPrimario,
    600: coloarPrimario,
    700: coloarPrimario,
    800: coloarPrimario,
    900: coloarPrimario,
  },
);
const MaterialColor blueThemeDark = MaterialColor(
  _bluePrimaryValueDark,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: coloarPrimarioDark,
    200: coloarPrimarioDark,
    300: coloarPrimarioDark,
    400: coloarPrimarioDark,
    500: coloarPrimarioDark,
    600: coloarPrimarioDark,
    700: coloarPrimarioDark,
    800: coloarPrimarioDark,
    900: coloarPrimarioDark,
  },
);