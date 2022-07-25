import 'package:flutter/material.dart';
import 'package:simple_code_1_assignment/constants/app_colors.dart';
import 'package:simple_code_1_assignment/constants/app_styles.dart';

import '../constants/app_assets.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon(
    this.id, {
    Key? key,
    this.margin,
    this.border,
    this.radius = 36.0,
  }) : super(key: key);

  final BoxBorder? border;
  final EdgeInsets? margin;
  final double radius;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: CircleAvatar(
        child: Text(id!, style: AppStyles.s12w400),
        backgroundColor: AppColors.circleBackground,
        radius: radius,
      ),
    );
  }
}
