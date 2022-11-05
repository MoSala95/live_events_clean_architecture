import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_events_clean_architecture/core/constants/app_assets.dart';
import 'package:live_events_clean_architecture/core/constants/app_colors.dart';
import 'package:live_events_clean_architecture/core/ui_helpers/ui_styles.dart';

class CustomSnackBars {
  static showError(
    message, {
    String? title,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buildCustomSnackBar(
          title: Text(
            title ?? "error".tr,
            style: TextStyle(color: const Color.fromRGBO(245, 101, 87, 1),fontSize: UiStyles.font15Size),
          ),
          message:  Text(
            message,
            style: TextStyle(color: AppColors.lightBlack,fontSize: UiStyles.font13Size),
          ),
          borderColor: const Color.fromRGBO(255, 161, 161, 0.63),
          icon: ImageIcon(
            AssetImage(AppAssets.unHappyImage),
            color: AppColors.coral,
            size: 40.r,
          ),
          color: AppColors.snackBarRedBg,
          seconds: 3);
    });
  }

  static showSuccess(message, {String? title, Color? color, Color? bgColor}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      buildCustomSnackBar(
          title: Text(
            title ?? "Success".tr,
            style: TextStyle(color: color ?? AppColors.greenblue,fontSize: UiStyles.font15Size),
          ),
          message:  Text(
            message,
            style: TextStyle(color: color ?? AppColors.lightBlack,fontSize: UiStyles.font13Size),
          ),
          seconds: 2,
          borderColor: color ?? const Color.fromRGBO(43, 206, 144, 0.45),
          icon: ImageIcon(
            AssetImage(AppAssets.happyImage),
            color: color ?? AppColors.greenblue,
            size: 40.r,
          ),
          color: bgColor ?? AppColors.snackBargreenBg);
    });
  }

  void showRemoveSuccess(String msg) {
    showSuccess(
      msg,
      color: AppColors.coral,
      bgColor: AppColors.snackBarRedBg,
    );
  }

  static buildCustomSnackBar(
      {required Widget title,
      required Widget message,
      required ImageIcon icon,
      required Color borderColor,
      int? seconds,
      Color? color}) {
    return Get.snackbar(
      "",
      "",
      messageText:message ,
      icon: icon,

      borderColor: borderColor,
      borderWidth: 2,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      titleText: title,
      backgroundColor: color ?? Colors.green,
      colorText: const Color.fromRGBO(135, 135, 135, 1),
      isDismissible: true,
      duration: Duration(seconds: seconds ?? 3),
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
    );
  }

}
