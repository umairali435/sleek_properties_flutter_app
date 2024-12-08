import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeUtils {
  static changeSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static getBrightness(context) => Theme.of(context).brightness;
}
