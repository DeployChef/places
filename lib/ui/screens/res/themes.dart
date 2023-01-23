import 'package:flutter/material.dart';
import 'package:places/styles/color_constants.dart';
import 'package:places/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimaryColor,
      primaryColorLight: AppColors.lightPrimaryColorLight,
      primaryColorDark: AppColors.lightPrimaryColorLight,
      accentColor: AppColors.lightAccentColor,
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      disabledColor: AppColors.lightPrimaryColorLight,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.lightBackgroundColor,
        secondary: AppColors.lightSecondaryColor,
        secondaryVariant: AppColors.lightSecondaryVariant,
        onPrimary: AppColors.lightPrimaryColorDark,
        primary: AppColors.lightPrimaryColorDark,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        color: AppColors.lightPrimaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline6: AppTypography.textSubtitle18.copyWith(color: AppColors.lightPrimaryColorDark),
        headline5: AppTypography.textText16.copyWith(color: AppColors.lightSecondaryColor),
        headline4: AppTypography.textTitle24.copyWith(color: AppColors.lightSecondaryColor),
        headline3: AppTypography.textLargeTitle32.copyWith(color: AppColors.lightPrimaryColorDark),
        subtitle1: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightSecondaryColor),
        subtitle2: AppTypography.textSmall14Bold.copyWith(color: AppColors.lightPrimaryColor),
        bodyText1: AppTypography.textSmall14.copyWith(color: AppColors.lightSecondaryColor),
        bodyText2: AppTypography.textSmall14.copyWith(color: AppColors.lightSecondaryVariant),
        button: AppTypography.textButton.copyWith(color: AppColors.lightPrimaryColor),
        caption: AppTypography.textSuperSmall12.copyWith(color: AppColors.lightSecondaryColor),
      ),
      primaryTextTheme: TextTheme(
        headline6: AppTypography.textSubtitle18.copyWith(color: AppColors.lightBackgroundColor),
        bodyText1: AppTypography.textSmall14.copyWith(color: AppColors.lightAccentColor),
        bodyText2: AppTypography.textSmall14.copyWith(color: AppColors.lightBackgroundColor),
      ),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.lightButtonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.lightPrimaryColor,
        selectedItemColor: AppColors.lightPrimaryColorDark,
        unselectedItemColor: AppColors.lightSecondaryColor,
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.lightSecondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        labelStyle: AppTypography.textSmall14Bold,
        labelColor: AppColors.lightPrimaryColor,
        unselectedLabelColor: AppColors.lightBackgroundColor,
        unselectedLabelStyle: AppTypography.textSmall14Bold,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.colorBlackDark,
        size: 24,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        thumbColor: AppColors.lightPrimaryColor,
        activeTrackColor: AppColors.lightAccentColor,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        backgroundColor: AppColors.lightAccentColor,
        elevation: 0,
        highlightElevation: 0,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        errorStyle: TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightAccentColor.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.colorInactiveBlack,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightErrorColor.withOpacity(0.40),
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightErrorColor.withOpacity(0.40),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }

  // ignore: long-method
  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return ThemeData(
      primaryColor: AppColors.colorBlackDark,
      primaryColorLight: AppColors.colorBlackDark,
      scaffoldBackgroundColor: AppColors.colorBlackMain,
      primaryColorDark: AppColors.darkPrimaryColorDark,
      backgroundColor: AppColors.darkScaffoldBackgroundColor,
      disabledColor: AppColors.darkPrimaryColorLight,
      accentColor: AppColors.darkAccentColor,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.darkBackgroundColor,
        secondary: AppColors.darkSecondaryColor,
        onPrimary: AppColors.colorWhite,
        primary: AppColors.darkButtonColorSplash,
      ),
      buttonTheme: base.buttonTheme.copyWith(
        disabledColor: AppColors.lightPrimaryColorLight,
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
        caption: AppTypography.textSuperSmall12.copyWith(color: AppColors.colorWhite),
      ),
      primaryTextTheme: TextTheme(
        headline6: AppTypography.textSubtitle18.copyWith(color: AppColors.darkBackgroundColor),
        bodyText1: AppTypography.textSmall14.copyWith(color: AppColors.darkAccentColor),
        bodyText2: AppTypography.textSmall14.copyWith(color: AppColors.darkBackgroundColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkPrimaryColor,
        selectedItemColor: AppColors.colorWhite,
        unselectedItemColor: AppColors.colorWhite,
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.lightSecondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        labelStyle: AppTypography.textSmall14Bold,
        labelColor: AppColors.lightPrimaryColor,
        unselectedLabelColor: AppColors.lightBackgroundColor,
        unselectedLabelStyle: AppTypography.textSmall14Bold,
      ),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.darkIconColor,
        size: 24,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        errorStyle: TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkAccentColor.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.colorInactiveBlack,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkErrorColor.withOpacity(0.40),
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkErrorColor.withOpacity(0.40),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }
}

/// постоянный цвет в обоих темах
extension CustomColorScheme on ColorScheme {
  Color get white => AppColors.colorWhite;
  Color get secondary => AppColors.colorSecondary;
  Color get secondary2 => AppColors.colorSecondary2;
  Color get inactiveBlack => AppColors.colorInactiveBlack;
  Color get green => brightness == Brightness.light ? AppColors.colorWhiteGreen : AppColors.colorBlackGreen;
  Color get yellow => brightness == Brightness.light ? AppColors.colorWhiteYellow : AppColors.colorBlackYellow;
}
