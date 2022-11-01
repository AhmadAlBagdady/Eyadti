import 'package:departments/shared/constant/color.dart';
import 'package:flutter/material.dart';

class Fonts {
  static TextStyle fRegular({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFont',
          fontWeight: FontWeight.w400,
          fontSize: size);

  static TextStyle fBlack({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontBlack',
          fontWeight: FontWeight.w900,
          fontSize: size);

  static TextStyle fBlackItalic({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontBlackItalic',
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: size);

  static TextStyle fBold({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontBold',
          fontWeight: FontWeight.w700,
          fontSize: size);

  static TextStyle fBoldItalic({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontBoldItalic',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          fontSize: size);

  static TextStyle fItalic({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontItalic',
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: size);

  static TextStyle fLight({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontLight',
          fontWeight: FontWeight.w300,
          fontSize: size);

  static TextStyle fLightItalic({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontLightItalic',
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          fontSize: size);

  static TextStyle semiBold({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontSemibold',
          fontWeight: FontWeight.w600,
          fontSize: size);

  static TextStyle semiBoldItalic(
          {required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontSemiboldItalic',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: size);

  static TextStyle semiLight({required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontSemilight',
          fontWeight: FontWeight.w200,
          fontSize: size);

  static TextStyle semiLightItalic(
          {required double size, Color color = black}) =>
      TextStyle(
          color: color,
          fontFamily: 'EnFontSemilightItalic',
          fontWeight: FontWeight.w200,
          fontStyle: FontStyle.italic,
          fontSize: size);
}
