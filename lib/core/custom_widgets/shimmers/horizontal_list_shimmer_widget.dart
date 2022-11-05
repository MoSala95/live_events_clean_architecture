import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_widget.dart';

class HorizontalListShimmerWidget extends StatelessWidget {
  const HorizontalListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(0),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 250.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CustomWidget.rectangular(
                  height: 90.h,
                  width: 230.w,
                ),
              ),
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
                    height: 8,
                    width: 100.w,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
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
        );
      },
    );
  }
}
