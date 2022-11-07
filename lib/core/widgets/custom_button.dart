import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/ui_styles.dart';
import '../utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;
  final double? width;
  final IconData? icon;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? iconColor;
  final String? image;
  final TextStyle? titleStyle;
  final LinearGradient? gradientColor;
  final double? iconSize;
  final bool? hasGradiant;
  final BorderRadiusGeometry? borderRadius;
  final bool? isDimmed;
  final int? iconDirection;
  final bool? hasBorder;
  final Color? borderColor;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.icon,
      this.height,
      this.margin,
      this.padding,
      this.color,
      this.iconColor,
      this.image,
      this.titleStyle,
      this.iconSize,
      this.iconDirection,
      this.hasGradiant = true,
      this.borderRadius,
      this.gradientColor,
      this.isDimmed = false,
      this.hasBorder,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    // double btnHeight = height ?? 6.h;
    return GestureDetector(
      onTap: () => isDimmed == true || onPressed == null ? null : onPressed!(),
      child: isDimmed! ? _buildDimmedButton() : _buildButton(),
    );
  }

  Widget _buildButton() {
    return _buildButtonContainer(
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: borderColor ?? AppColors.primaryColor.withOpacity(0.3),
                width: 1),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xb38b8b8b),
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0)
            ],
            gradient:
                color == null ? gradientColor ?? UiStyles.blueGradient : null),
        child: _buildButtonBody());
  }

  _buildDimmedButton() {
    return _buildButtonContainer(
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          color: AppColors.primaryColor.withOpacity(0.5)),
      child: _buildButtonBody(),
    );
  }

  Widget _buildButtonContainer(
      {required Widget child, required Decoration decoration}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        margin: margin ?? EdgeInsets.only(bottom: 10.h),
        width: width ?? double.infinity,
        height: height ?? 48.h,
        decoration: decoration,
        child: child);
  }

  Widget _buildButtonBody() {
    return Directionality(
      textDirection: iconDirection != 1 ? TextDirection.ltr : TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title == null
              ? const SizedBox()
              : Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: titleStyle ?? UiStyles.buttonTextStyle,
                ),
          icon == null && image == null
              ? const SizedBox()
              : Container(
                  height: height ?? 40.h,
                  // color: Colors.cyan,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: image != null
                      ? Center(
                          child: Image.asset(
                            image!,
                            height: iconSize ?? 16.r,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Icon(
                          icon,
                          color: iconColor ?? Colors.white,
                          size: iconSize ?? 16.w,
                        ),
                ),
        ],
      ),
    );
  }
}
