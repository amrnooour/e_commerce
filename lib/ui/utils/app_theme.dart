import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor ,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
        titleSmall: TextStyle(
            fontSize: 18,
            color: AppColors.blackColor.withOpacity(0.7),
            fontWeight: FontWeight.w300
        ),
        titleMedium: const TextStyle(
            fontSize: 24,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600
        ),
        titleLarge: const TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w300
        ),
        bodySmall: const TextStyle(
            fontSize: 18,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500
        ),
        bodyLarge: const TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600
        )
    ),
  );
}