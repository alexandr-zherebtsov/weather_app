import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/shared/design_system/colors.dart';
import 'package:weather_app/shared/design_system/text_styles.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    brightness: AppColors.brightnessLight,
    primarySwatch: AppColors.green,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.black,
        fontSize: AppTextStyles.kCommonXXXXXLarge,
        fontWeight: AppTextStyles.kBold,
      ),
      headline2: TextStyle(
        color: AppColors.black,
        fontSize: AppTextStyles.kCommonXXXXLarge,
        fontWeight: AppTextStyles.kNormal,
      ),
      headline3: TextStyle(
        color: AppColors.black,
        fontSize: AppTextStyles.kCommonXXLarge,
        fontWeight: AppTextStyles.kNormal,
      ),
      headline4: TextStyle(
        color: AppColors.black,
        fontSize: AppTextStyles.kCommonLarge,
        fontWeight: AppTextStyles.kMedium,
      ),
      bodyText1: TextStyle(
        color: AppColors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppTextStyles.kCommonXXLarge,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
  );
}
