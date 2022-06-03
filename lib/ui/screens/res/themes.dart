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
        headline6: AppTypography.textSubtitle18.copyWith(color: AppColors.lightPrimaryColorDark),
      headline5: AppTypography.textText16.copyWith(color: AppColors.lightSecondaryColor),
      headline4: AppTypography.textTitle24.copyWith(color: AppColors.lightSecondaryColor),
      headline3: AppTypography.textLargeTitle32.copyWith(color: AppColors.lightPrimaryColorDark),
      subtitle1: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightSecondaryColor),
      subtitle2: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightPrimaryColor),
      bodyText1: AppTypography.textSmall14.copyWith(color: AppColors.lightSecondaryColor),
      bodyText2: AppTypography.textSmall14.copyWith(color: AppColors.lightSecondaryVariant),
      button: AppTypography.textButton,
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
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.lightIconColor,
        size: 24,
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return ThemeData(
      primaryColor: AppColors.colorBlackDark,
      primaryColorLight: AppColors.colorBlackDark,
      scaffoldBackgroundColor: AppColors.colorBlackMain,
      primaryColorDark: AppColors.darkPrimaryColorDark,
      backgroundColor: AppColors.darkScaffoldBackgroundColor,
      accentColor: AppColors.darkAccentColor,
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
        headline6: AppTypography.textSubtitle18.copyWith(color: AppColors.colorWhite),
      headline5: AppTypography.textText16.copyWith(color: AppColors.colorWhite),
      headline4: AppTypography.textTitle24.copyWith(color: AppColors.colorWhite),
      headline3: AppTypography.textLargeTitle32.copyWith(color: AppColors.colorWhite),
      subtitle1: AppTypography.textSmall14Bold.copyWith(color: AppColors.darkSecondaryVariant),
      subtitle2: AppTypography.textSmall14Bold.copyWith(color: AppColors.colorWhite),
      bodyText1: AppTypography.textSmall14.copyWith(color: AppColors.colorWhite),
      bodyText2: AppTypography.textSmall14.copyWith(color: AppColors.darkBackgroundColor),
      button: AppTypography.textButton,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkPrimaryColor,
        selectedItemColor: AppColors.colorWhite,
        unselectedItemColor: AppColors.colorWhite,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.darkIconColor,
        size: 24,
      ),
    );
  }
}
