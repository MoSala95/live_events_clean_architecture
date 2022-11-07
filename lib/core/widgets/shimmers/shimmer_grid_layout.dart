import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class ShimmerGridLayout extends StatelessWidget {
  const ShimmerGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
          color: AppColors.shimmerGrey,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
