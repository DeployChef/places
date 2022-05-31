import 'package:flutter/material.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return ThemeData(
        primaryColor: AppColors.colorWhite,
        primaryColorLight: AppColors.lightPrimaryColorLight,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline3: AppTypography.largeTitleStyle.copyWith(color: AppColors.lightPrimaryColorDark),
          headline5: AppTypography.text16Style.copyWith(color: AppColors.lightPrimaryColorDark),
          subtitle2: AppTypography.text14BoldStyle.copyWith(color: AppColors.lightPrimaryColorDark),
          bodyText1: AppTypography.text14Style.copyWith(color: AppColors.lightSecondaryColor),
          bodyText2: AppTypography.text14Style.copyWith(color: AppColors.lightSecondaryColor),
        ),
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: AppColors.colorWhiteGreen,
          textTheme: ButtonTextTheme.primary,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightPrimaryColor,
          selectedItemColor: AppColors.lightPrimaryColorDark,
          unselectedItemColor: AppColors.lightSecondaryColor,
        ),
        sliderTheme: SliderThemeData.fromPrimaryColors(
            primaryColor: AppColors.lightPrimaryColorDark,
            primaryColorDark: AppColors.lightPrimaryColorDark,
            primaryColorLight: AppColors.lightPrimaryColorDark,
            valueIndicatorTextStyle: TextStyle()));
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return ThemeData(
      primaryColor: AppColors.colorBlackDark,
      primaryColorLight: AppColors.colorBlackDark,
      scaffoldBackgroundColor: AppColors.colorBlackMain,
      primaryColorDark: AppColors.darkPrimaryColorDark,
      backgroundColor: AppColors.darkScaffoldBackgroundColor,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.darkBackgroundColor,
        secondary: AppColors.darkSecondaryColor,
        onPrimary: AppColors.colorWhite,
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.colorBlackGreen,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        headline3: AppTypography.largeTitleStyle.copyWith(color: AppColors.colorWhite),
        subtitle2: AppTypography.text14BoldStyle.copyWith(color: AppColors.colorWhite),
        headline5: AppTypography.text16Style.copyWith(color: AppColors.colorWhite),
        bodyText2: AppTypography.text14Style.copyWith(color: AppColors.darkBackgroundColor),
        bodyText1: AppTypography.text14Style.copyWith(color: AppColors.colorWhiteGreen),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkPrimaryColor,
        selectedItemColor: AppColors.colorWhite,
        unselectedItemColor: AppColors.colorWhite,
      ),
    );
  }
}
