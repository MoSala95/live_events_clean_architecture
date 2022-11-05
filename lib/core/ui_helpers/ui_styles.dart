import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

class UiStyles {
  static const String englishFontFamily = "Montserrat";
  static const String arabicFontFamily = "NeoSansArabic";

  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight semiBoldFontWeight = FontWeight.w600;
  static const FontWeight boldFontWeight = FontWeight.w700;

  // static final SettingsService settingsService = Get.find<SettingsService>();

  static final font12Size = 12.sp;
  static final font13Size = 13.sp;
  static final font14Size = 14.sp;
  static final font15Size = 15.sp;
  static final font16Size = 16.sp;
  static final font17Size = 17.sp;
  static final font18Size = 18.sp;
  static final font19Size = 19.sp;
  static final font20Size = 20.sp;
  static final font21Size = 21.sp;
  static final font22Size = 22.sp;
  static final font23Size = 23.sp;
  static final font24Size = 24.sp;
  static final font25Size = 25.sp;
  static final font26Size = 26.sp;
  static final font27Size = 27.sp;
  static final font28Size = 28.sp;
  static final font29Size = 29.sp;
  static final font30Size = 30.sp;
  static final font32Size = 32.sp;
  static final font34Size = 34.sp;


  static final titleTextStyle = TextStyle(
    //color: AppColors.black,
    fontWeight: semiBoldFontWeight,
    fontStyle: FontStyle.normal,
    fontSize: font16Size,
  );

  static final medium14TextStyle = TextStyle(
    fontWeight: mediumFontWeight,
    fontSize: font14Size,
  );
  static final black14SpRegularTextStyle = titleTextStyle.copyWith(
      fontWeight: regularFontWeight, fontSize: font14Size, color: Colors.black);

  static final navy14SpBoldTextStyle = titleTextStyle.copyWith(
      fontWeight: boldFontWeight, fontSize: font14Size, color: AppColors.navy);

  static final black13SpRegularTextStyle =
      black14SpRegularTextStyle.copyWith(fontSize: font13Size);

  static TextStyle get buttonTextStyle => TextStyle(
      color: Colors.white,
      fontWeight: UiStyles.semiBoldFontWeight,
      fontSize: UiStyles.font15Size);

  static const blueGradient = LinearGradient(
    colors: [AppColors.primaryColor, AppColors.waterBlue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  //Themes
  static final buttonThemeData = ButtonThemeData(
      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
      buttonColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      textTheme: ButtonTextTheme.normal);
}
