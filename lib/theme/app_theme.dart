import 'package:flutter/material.dart';
import '../constant/my_colors.dart';

class AppTheme {
  // light mode ##################################
  static ThemeData lightMode = ThemeData(
    hoverColor: imageGreadent,
    splashColor: onBoardingButton,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backGroundColor,
    dividerColor: darkDivider,
    shadowColor: lightShadow,
    primaryColor: lightAccent,
    cardColor: lightCard,
    iconTheme: IconThemeData(color: lightIcon),
    buttonTheme: ButtonThemeData(buttonColor: signinButton),
    primaryIconTheme: IconThemeData(color: selectedIcon),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: lightTextPrimary),
      bodyMedium: TextStyle(color: lightTextSecondary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backGroundColor,
      elevation: 0,

      titleTextStyle: TextStyle(
        color: lightTextPrimary,

        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightCard,
      selectedItemColor: lightAccent,
      unselectedItemColor: lightTextSecondary,
    ),
  );
  // dark mode ##################################
  static ThemeData darkMode = ThemeData(
    hoverColor: darkImageGreadent,
    splashColor: darkOnBoardingButton,
    brightness: Brightness.dark,
    shadowColor: darkShadow,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: darkAccent,
    cardColor: darkCard,
    buttonTheme: ButtonThemeData(buttonColor: darkSigninButton),
    dividerColor: lightDivider,
    iconTheme: IconThemeData(color: darkIcon),
    primaryIconTheme: IconThemeData(color: darkSelectedIcon),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: darkTextPrimary),
      bodyMedium: TextStyle(color: darkTextSecondary),
      titleLarge: TextStyle(color: darkTextPrimary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackground,

      elevation: 0,
      iconTheme: IconThemeData(color: darkIcon),
      titleTextStyle: TextStyle(
        color: darkTextPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkAccent,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkCard,
      selectedItemColor: darkAccent,
      unselectedItemColor: darkTextSecondary,
    ),
  );
}
