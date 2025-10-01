import 'package:flutter/material.dart';

class AppSizes {
  double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static const double _baseUnit = 4.0;
  static const double _unit1p5 = 1.5;
  static const double _unit2 = 2.0;
  static const double _unit3 = 3.0;
  static const double _unit3p5 = 3.5;
  static const double _unit4p5 = 4.5;
  static const double _unit5 = 5.0;
  static const double _unit6 = 6.0;
  static const double _unit7p5 = 7.5;
  static const double _unit9 = 9.0;
  static const double _unit12p5 = 12.5;

  /// Font Sizes
  double fontSize12 = _baseUnit * _unit3;
  double fontSize14 = _baseUnit * _unit3p5;
  double fontSize16 = _baseUnit * _baseUnit;
  double fontSize18 = _baseUnit * _unit4p5;
  double fontSize24 = _baseUnit * _unit6;

  /// Icon Sizes
  double iconSize24 = _baseUnit * _unit6;

  /// Radius
  double radius2 = _baseUnit / 2;
  double radius12 = _baseUnit * _unit3;
  double radius20 = _baseUnit * _unit5;
  double radius50 = _baseUnit * _unit12p5;

  ///
  double spacing2 = _baseUnit / 2;
  double spacing4 = _baseUnit;
  double spacing6 = _baseUnit * _unit1p5;
  double spacing8 = _baseUnit * _unit2;
  double spacing12 = _baseUnit * _unit3;
  double spacing16 = _baseUnit * _baseUnit;
  double spacing24 = _baseUnit * _unit6;
  double spacing30 = _baseUnit * _unit7p5;
  double spacing36 = _baseUnit * _unit9;
}
