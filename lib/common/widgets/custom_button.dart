import 'package:sleek_properties_flutter/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.overlayColor,
    this.padding,
    this.radius,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Function()? onPressed;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          overlayColor ?? AppColors.white.withOpacity(0.4),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? AppColors.primaryColor,
        ),
        elevation: WidgetStateProperty.all<double>(0.0),
        foregroundColor: WidgetStateProperty.all<Color>(
          foregroundColor ?? AppColors.white,
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          padding ?? EdgeInsets.all(12.sp),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 7),
            side: BorderSide(
              width: borderColor == null ? 0.0 : 1.0,
              color: borderColor ?? AppColors.white,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
