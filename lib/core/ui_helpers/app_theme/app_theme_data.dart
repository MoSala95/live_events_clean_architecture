import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';
import 'package:live_events_clean_architecture/core/constants/app_colors.dart';

import '../ui_styles.dart';

class AppThemeData {
  static final SettingsService settingService = Get.find<SettingsService>();

  static ThemeData get lightTheme {
    return ThemeData(
        fontFamily: settingService.isArabic
            ? UiStyles.arabicFontFamily
            : UiStyles.englishFontFamily,
        primaryColor: AppColors.primaryColor,
        colorScheme: const ColorScheme(
          surface: Colors.white,
          secondary: AppColors.waterBlue,
          background: Colors.black,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.black,
          onError: Colors.red,
          onPrimary: Colors.white,
          onSecondary: AppColors.waterBlue,
          onSurface: Colors.black,
          primary: AppColors.primaryColor,
        ),
        textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: settingService.isArabic
                ? UiStyles.arabicFontFamily
                : UiStyles.englishFontFamily,
            bodyColor: Colors.black,
            displayColor: Colors.black),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        buttonTheme: UiStyles.buttonThemeData,
        // backgroundColor: Colors.white,
        backgroundColor: AppColors.whiteTen,
        scaffoldBackgroundColor: AppColors.whiteTen,
        dividerColor: Colors.white54,
         iconTheme: const IconThemeData(
          color: AppColors.lightBlueTwo,
        ), //to apply same color icon through all the app
        canvasColor: Colors.white,
        shadowColor: Colors.black);
  }

}
