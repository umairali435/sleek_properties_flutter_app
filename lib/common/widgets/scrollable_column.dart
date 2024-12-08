import 'package:sleek_properties_flutter/common/constants/app_padding.dart';
import 'package:sleek_properties_flutter/common/theme/colors.dart';
import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  final List<Widget> childrens;
  const ScrollableColumn({super.key, required this.childrens});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryColor.withOpacity(0.31),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: childrens,
              )
            ],
          ),
        ),
      ),
    );
  }
}
