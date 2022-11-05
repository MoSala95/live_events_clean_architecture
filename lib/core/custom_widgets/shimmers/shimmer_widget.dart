import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'shimmer_grid_layout.dart';

// ignore: must_be_immutable
class ShimmerWidget extends StatelessWidget {
  final bool isGrid;
  final bool withShimmerPadding;
  final Widget widget;
  final Color? baseColor;
  final Color? highlightColor;

  ShimmerWidget({super.key, 
    required this.isGrid,
    required this.withShimmerPadding,
    required this.widget,
    this.baseColor,
    this.highlightColor,
  });
  int offset = 0;
  int time = 1000;

  @override
  Widget build(BuildContext context) {
    return buildListView(time, offset);
  }

  Widget buildWidgetView({required Widget child}) {
    offset += 5;
    time = 800 + offset;
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.grey[200]!,
      baseColor: baseColor ?? Colors.grey[350]!,
      period: Duration(milliseconds: time),
      child: child,
    );
  }

  Widget buildListView(int time, int offset) {
    if (isGrid) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return buildWidgetView(child: const ShimmerGridLayout());
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
      );
    }
    return Padding(
      padding: (withShimmerPadding == true)
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.all(0),
      child: widget,


    );
  }
}
