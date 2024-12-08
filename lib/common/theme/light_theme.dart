import 'package:sleek_properties_flutter/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.grey.withOpacity(0.2),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w900,
          color: AppColors.black,
          fontSize: 30.0.sp,
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 18.0.sp,
          color: AppColors.black,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 28.0.sp,
          color: AppColors.black,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 22.0.sp,
          color: AppColors.black,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16.0.sp,
          color: AppColors.black,
        ),
        displaySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w100,
          fontSize: 14.0.sp,
          color: AppColors.black,
        ),
      ),
    );
