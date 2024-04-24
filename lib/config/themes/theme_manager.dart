import 'package:flutter/material.dart';
import 'package:flutter_todo/config/themes/dark_theme.dart';
import 'package:flutter_todo/config/themes/light_theme.dart';

class ThemeManager {
  static final ThemeData light = LightTheme().theme;
  static final ThemeData dark = DarkTheme().theme;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;
}

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;
  CheckboxThemeData get checkboxTheme => theme.checkboxTheme;
}
