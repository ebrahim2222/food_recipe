import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color fontColor) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: fontColor);
}

// thin style

TextStyle getThinStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.thin, color);
}

// extraLight style

TextStyle getExtraLightStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.extraLight, color);
}

// light style

TextStyle getLightStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.ligth, color);
}

// regular style

TextStyle getReqularStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.reqular, color);
}

// meduim style

TextStyle getMediumStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.medium, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.bold, color);
}

// semiBold style

TextStyle getSemiBoldStyle({double fontSize = 12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.semiBold, color);
}

// extraBold style

TextStyle getExtraBoldStyle({fontSize, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.extraBold, color);
}
