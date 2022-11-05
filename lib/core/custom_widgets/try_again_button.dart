import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class TrayAgainButton extends StatelessWidget {
  final Function onPressed;
  const TrayAgainButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        title: "tryAgain".tr,
        width: 0.40.sw,
        onPressed: onPressed,
      ),
    );
  }
}
