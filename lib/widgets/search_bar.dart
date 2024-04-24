import 'package:flutter/material.dart';
import 'package:flutter_todo/config/themes/theme_manager.dart';

class CustomSearchBar extends StatelessWidget {
  final IconData _prefixIcon;
  final String _hintText;
  final void Function(String)? _onChanged;
  final void Function(String)? _onSubmitted;
  final void Function()? _onEditingComplete;

  const CustomSearchBar(
      {super.key,
      required IconData prefixIcon,
      required String hintText,
      void Function(String)? onChanged,
      void Function(String)? onSubmitted,
      void Function()? onEditingComplete})
      : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _onChanged = onChanged,
        _onSubmitted = onSubmitted,
        _onEditingComplete = onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: context.theme.shadowColor,
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
      child: TextField(
        onChanged: _onChanged,
        onSubmitted: _onSubmitted,
        onEditingComplete: _onEditingComplete,
        cursorColor: context.colorScheme.onPrimary,
        decoration: InputDecoration(
          hintText: _hintText,
          prefixIcon: Icon(_prefixIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color:
                      context.inputDecorationTheme.border?.borderSide.color ??
                          context.colorScheme.onBackground)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color: context.inputDecorationTheme.focusedBorder?.borderSide
                          .color ??
                      context.colorScheme.onBackground)),
        ),
      ),
    );
  }
}
