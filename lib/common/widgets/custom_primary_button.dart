import 'package:sleek_properties_flutter/common/extensions/context_extentions.dart';
import 'package:sleek_properties_flutter/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final Color? color;
  final VoidCallback onPressed;
  const CustomPrimaryButton({
    super.key,
    this.height,
    this.width,
    required this.title,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: width ?? 350.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: Center(
          child: Text(
            title,
            style: context.theme.headlineSmall!.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
