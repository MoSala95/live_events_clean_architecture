import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/themes/ui_styles.dart';
import '../../utils/constants/app_colors.dart';

Future showCustomBottomSheet({
  required Widget widget,
  required bool isFullScreen,
  String? title,
  double? height,
  Function()? whenComplete,
  Color? backgroundColor,
}) {
  return Get.bottomSheet(
          Container(
              height: height,
              padding:
                  isFullScreen ? EdgeInsets.only(top: 32.h) : EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.r,
                    right: 16.r,
                    left: 16.r), //changed from all to remove bottom padding
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: backgroundColor ?? AppColors.whiteTen,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Row(
                        children: [
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            title,
                            style: UiStyles.titleTextStyle,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Expanded(child: widget),
                  ],
                ),
              )),
          barrierColor: AppColors.darkSlateBlue.withOpacity(.7),
          isScrollControlled: isFullScreen ? true : false)
      .whenComplete(() {
    if (whenComplete != null) {
      whenComplete();
    }
  });
}
