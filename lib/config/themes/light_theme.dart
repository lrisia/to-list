import 'package:flutter/material.dart';
import 'package:flutter_todo/config/themes/theme_generator.dart';

class LightTheme extends ThemeGenerator {
  LightTheme() {
    super.generate(
      dividerColor: Colors.grey,
      shadowColor: Colors.grey.withOpacity(0.5),
      primaryColor: Colors.white,
      onPrimaryColor: Colors.black,
      secondaryColor: Colors.white,
      onSecondaryColor: Colors.black,
      errorColor: Colors.red,
      onErrorColor: Colors.white,
      backgroundColor: Colors.white,
      onBackgroundColor: Colors.black,
      widgetBackgroundColor: Colors.white,
      onWidgetBackgroundColor: Colors.black,
      appBarIconColor: Colors.black,
      textHeadlineLargeColor: Colors.black,
      textTitleLargeColor: Colors.black,
      textBodyMediumColor: Colors.black87,
      textFieldHintColor: Colors.grey,
      textFieldPrefixIconColor: Colors.black,
      textFieldBorderColor: Colors.black,
      textFieldFocusedBorderColor: Colors.black,
      checkboxCheckColor: Colors.black,
    );
  }
}
