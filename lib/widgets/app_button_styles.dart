import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class AppButtonStyles {
  static final elevated1 = ElevatedButton.styleFrom(
    primary: AppColors.primary,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
    ),
  );

  static final outlined1 = OutlinedButton.styleFrom(
    textStyle: AppStyles.s16w400.copyWith(
      color: AppColors.primary,
    ),
    side: const BorderSide(
      color: AppColors.primary,
      width: 1.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 10.0,
    ),
  );

  static final text1 = TextButton.styleFrom(
    primary: AppColors.more1,
    textStyle: AppStyles.s14w400,
  );
}
