
import 'package:flutter/material.dart';
import 'package:project_setup/app/app_labels.dart';
import 'package:project_setup/app/colors.dart';
import 'screen_constants.dart';

class TextStyles {

  // Manual Text Style Widget
  static TextStyle get blankTest => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );
}


//Overall Text Style system
Widget text(String text,
    {double fontSize = 14,
      textColor = AppColors.textColorPrimary,
      var fontFamily = AppLabels.fontLatoNormal,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}

//Overall Text Style system
Widget textList(String text,
    {double fontSize = 14,
      bool isSelected = false,
      textColor = AppColors.textColorPrimary,
      var fontFamily = AppLabels.fontLatoNormal,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        backgroundColor: isSelected ? Colors.blueGrey : Colors.white,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}


//Overall Text Style system
Widget boldtext(String text,
    {double fontSize = 16,
      textColor = AppColors.textColorPrimary,
      var fontFamily = AppLabels.fontLatoNormal,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        fontWeight: FontWeight.bold,
        letterSpacing: latterSpacing),
  );
}
/*
{
FontWeight.w100: 'Thin',
FontWeight.w200: 'ExtraLight',
FontWeight.w300: 'Light',
FontWeight.w400: 'Regular',
FontWeight.w500: 'Medium',
FontWeight.w600: 'SemiBold',
FontWeight.w700: 'Bold',
FontWeight.w800: 'ExtraBold',
FontWeight.w900: 'Black',
}*/
