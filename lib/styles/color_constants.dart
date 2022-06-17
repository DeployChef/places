import 'package:flutter/material.dart';

class AppColors {
  static const colorWhite = Colors.white;
  static const colorBackground = Color(0xffF5F5F5);
  static const colorSecondary = Color(0xff3B3E5B);
  static const colorSecondary2 = Color(0xff7C7E92);
  static const colorInactiveBlack = Color.fromRGBO(124, 126, 146, 0.56);

  static const colorWhiteGreen = Color(0xff4CAF50);
  static const colorWhiteYellow = Color(0xffFCDD3D);
  static const colorWhiteError = Color(0xffEF4343);
  static const colorWhiteMain = Color(0xff252849);

  static const colorBlackGreen = Color(0xff6ADA6F);
  static const colorBlackYellow = Color(0xffFFE769);
  static const colorBlackError = Color(0xffCF2A2A);
  static const colorBlackDark = Color(0xff1A1A20);
  static const colorBlackMain = Color(0xff21222C);

  ///светлая тема
  static const Color lightPrimaryColor = colorWhite,
      lightPrimaryColorLight = colorBackground,
      lightPrimaryColorDark = colorWhiteMain,
      lightAccentColor = colorWhiteGreen,
      lightScaffoldBackgroundColor = colorWhite,
      lightErrorColor = colorWhiteError,
      lightBackgroundColor = colorInactiveBlack,
      lightSecondaryColor = colorSecondary,
      lightSecondaryVariant = colorSecondary2,
      lightDividerColor = colorInactiveBlack,
      lightIconColor = colorWhite,
      lightButtonColor = colorWhiteGreen;

  ///Тёмная тема
  static const Color darkPrimaryColor = colorBlackMain,
      darkPrimaryColorLight = colorBlackMain,
      darkPrimaryColorDark = colorBlackDark,
      darkAccentColor = colorBlackGreen,
      darkScaffoldBackgroundColor = colorBlackMain,
      darkErrorColor = colorBlackError,
      darkBackgroundColor = colorInactiveBlack,
      darkSecondaryColor = colorSecondary,
      darkSecondaryVariant = colorSecondary2,
      darkDividerColor = colorInactiveBlack,
      darkIconColor = colorWhite,
      darkButtonColor = colorBlackGreen;
}
