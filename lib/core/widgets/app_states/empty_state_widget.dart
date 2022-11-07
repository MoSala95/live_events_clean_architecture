import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_assets.dart';

class EmptyStateWidget extends StatelessWidget {
  final Function()? onRetry;
  final Function()? onExplore;
  final double? width;
  final String? image;
  final String? title;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final Widget? emptyStateButton;

  const EmptyStateWidget(
      {super.key,
      this.onRetry,
      this.onExplore,
      this.width,
      this.image,
      this.title,
      this.margin,
      this.emptyStateButton,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image ?? AppAssets.emptyResult,
            // height: height ?? 25.h,
            width: width ?? 80.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title ?? "NoResultAvailable".tr,
            // style: UiStyles.selectedTapBarStyle,
            textAlign: TextAlign.center,
          ),
          if (onExplore != null)
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: onExplore,
                    child: SizedBox(
                      width: 120.w,
                      height: 40.h,
                      // decoration: UiStyles.shadowDecoration,
                      child: Center(
                          child: Text(
                        "Explore".tr,
                        // style: UiStyles.selectedTapBarStyle
                        //     .copyWith(color: AppColors.primaryColor),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          if (emptyStateButton != null) emptyStateButton!
        ],
      ),
    );
  }
}
