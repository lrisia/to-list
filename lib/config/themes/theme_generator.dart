import 'package:flutter/material.dart';

class ThemeGenerator {
  ThemeData _theme = ThemeData();

  ThemeData get theme => _theme;

  void generate({
    required Color dividerColor,
    required Color shadowColor,
    /* Color schema */
    required Color primaryColor,
    required Color onPrimaryColor,
    required Color secondaryColor,
    required Color onSecondaryColor,
    required Color errorColor,
    required Color onErrorColor,
    required Color backgroundColor,
    required Color onBackgroundColor,
    required Color widgetBackgroundColor,
    required Color onWidgetBackgroundColor,
    /* Appbar */
    required Color appBarIconColor,
    /* Text */
    required Color textHeadlineLargeColor,
    required Color textTitleLargeColor,
    required Color textBodyMediumColor,
    /* Text field */
    required Color textFieldHintColor,
    required Color textFieldPrefixIconColor,
    required Color textFieldBorderColor,
    required Color textFieldFocusedBorderColor,
    /* Checkbox */
    required Color checkboxCheckColor,
  }) {
    _theme = ThemeData(
        brightness: Brightness.light,
        dividerColor: dividerColor,
        shadowColor: shadowColor,
        colorScheme: ColorScheme(
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onSecondaryColor,
          error: errorColor,
          onError: onErrorColor,
          background: backgroundColor,
          onBackground: onBackgroundColor,
          surface: widgetBackgroundColor,
          onSurface: onWidgetBackgroundColor,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: appBarIconColor),
          elevation: 0,
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textHeadlineLargeColor,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textTitleLargeColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: textBodyMediumColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(0),
          hintStyle: TextStyle(
            color: textFieldHintColor,
          ),
          prefixIconColor: textFieldPrefixIconColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: textFieldBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textFieldFocusedBorderColor,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(checkboxCheckColor)));
  }
}
