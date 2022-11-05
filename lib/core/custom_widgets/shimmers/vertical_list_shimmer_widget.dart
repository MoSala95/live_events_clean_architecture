import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_events_clean_architecture/core/constants/app_colors.dart';

import 'custom_widget.dart';

class VerticalListShimmerWidget extends StatelessWidget {
  const VerticalListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(0),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
          // height: 155.h,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.whiteThree, width: 1)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shimmerGrey!,
                        offset: const Offset(3, 3),
                        blurRadius: 20,
                        spreadRadius: 0)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CustomWidget.rectangular(
                    height: 140.h,
                    width: 100.w,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomWidget.rectangular(
                          height: 10,
                          width: 150.w,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        const CustomWidget.circular(height: 30, width: 30),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomWidget.rectangular(
                          height: 10,
                          width: 100.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomWidget.rectangular(
                          height: 10,
                          width: 150.w,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
