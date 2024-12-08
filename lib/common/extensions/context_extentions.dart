import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}
