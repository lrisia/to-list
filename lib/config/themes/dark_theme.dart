import 'package:flutter/material.dart';
import 'package:flutter_todo/config/themes/theme_generator.dart';

class DarkTheme extends ThemeGenerator {
  DarkTheme() {
    super.generate(
      dividerColor: Colors.grey,
      shadowColor: Colors.black,
      primaryColor: const Color(0xFF121212),
      onPrimaryColor: Colors.white,
      secondaryColor: const Color(0xFF121212),
      onSecondaryColor: Colors.white,
      errorColor: Colors.red,
      onErrorColor: Colors.white,
      backgroundColor: const Color(0xFF121212),
      onBackgroundColor: Colors.white,
      widgetBackgroundColor: const Color(0xF2121212),
      onWidgetBackgroundColor: Colors.white,
      appBarIconColor: Colors.white,
      textHeadlineLargeColor: const Color.fromARGB(255, 234, 234, 234),
      textTitleLargeColor: const Color.fromARGB(255, 234, 234, 234),
      textBodyMediumColor: const Color.fromARGB(255, 180, 180, 180),
      textFieldHintColor: Colors.grey,
      textFieldPrefixIconColor: Colors.white,
      textFieldBorderColor: Colors.purple,
      textFieldFocusedBorderColor: Colors.black,
      checkboxCheckColor: Colors.white,
    );
  }
}
