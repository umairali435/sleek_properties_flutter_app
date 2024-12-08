import 'package:sleek_properties_flutter/common/theme/light_theme.dart';
import 'package:sleek_properties_flutter/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final String title;
  final bool showDebugBanner;
  static const double _designWidth = 430;
  static const double _designHeight = 932;
  const MyApp({required this.title, required this.showDebugBanner, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(MyApp._designWidth, MyApp._designHeight),
      builder: (context, widget) => MaterialApp.router(
        debugShowCheckedModeBanner: showDebugBanner,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        routerConfig: router,
        locale: const Locale("en"),
        title: title,
      ),
    );
  }
}
