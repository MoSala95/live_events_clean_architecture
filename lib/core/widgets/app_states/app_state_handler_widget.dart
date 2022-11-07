import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_events_clean_architecture/core/utils/print.dart';
import 'package:live_events_clean_architecture/core/widgets/try_again_button.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/enums/app_enum.dart';
import '../shimmers/shimmer_widget.dart';
import 'empty_state_widget.dart';

class AppStateHandlerWidget extends StatelessWidget {
  final Function()? onRetry;
  final Widget child;
  final LoadingState state;
  final bool isGridShimmer;
  final bool withShimmerPadding;
  final Widget? onEmpty;
  final Widget? onWaiting;
  final Widget? shimmerWidget;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final bool isShimmer;
  final Function()? onExplore;
  final String? emptyStateImage;
  final String? emptyStateTitle;
  final bool isTryAgain;
  final Widget? customShimmerWidget;
  final Widget? tryAgainWidget;
  final double? tryAgainContainerHeight;
  final double? loadingContainerHeight;
  final double? emptyContainerHeight;
  final double? width;
  final Widget? emptyStateButton;
  final Widget? emptyStateWidget;

  const AppStateHandlerWidget(
      {super.key,
      required this.child,
      required this.state,
      this.onRetry,
      this.isGridShimmer = false,
      this.isTryAgain = false,
      this.onEmpty,
      this.onWaiting,
      this.withShimmerPadding = false,
      this.shimmerWidget,
      this.shimmerBaseColor,
      this.shimmerHighlightColor,
      this.onExplore,
      this.isShimmer = false,
      this.emptyStateImage,
      this.emptyStateTitle,
      this.width,
      this.customShimmerWidget,
      this.tryAgainWidget,
      this.tryAgainContainerHeight,
      this.emptyContainerHeight,
      this.emptyStateButton,
      this.emptyStateWidget,
      this.loadingContainerHeight});

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<InternetService>(builder: (internetController) {
    iPrint(state.toString());
    return Stack(
      children: [
        _buildChild(state),
        ////////
        if (state == LoadingState.waiting && customShimmerWidget != null)
          customShimmerWidget!
        else if (state == LoadingState.waiting && customShimmerWidget == null)
          isShimmer == true
              ? ShimmerWidget(
                  isGrid: isGridShimmer,
                  withShimmerPadding: withShimmerPadding,
                  widget: shimmerWidget ?? const SizedBox(),
                  baseColor: shimmerBaseColor,
                  highlightColor: shimmerHighlightColor,
                )
              : Container(
                  color: Colors.white.withOpacity(0.6),
                  height: loadingContainerHeight ?? 1.sh,
                  width: 1.sw,
                  child: Center(
                    child: Lottie.asset(AppAssets.lottieLoadingIndicator,
                        height: 130.h),
                  ),
                )
        else if (state == LoadingState.error)
          // ErrorrStateWidget(onRetry: onRetry)
          Container(
            color: Colors.white.withOpacity(0.5),
            height: tryAgainContainerHeight ?? 0.9.sh,
            child: Center(
              child: TrayAgainButton(
                onPressed: onRetry ?? () {},
              ),
            ),
          )
        else if (state == LoadingState.empty)
          emptyStateWidget ??
              EmptyStateWidget(
                height: emptyContainerHeight,
                onRetry: onRetry,
                onExplore: onExplore,
                image: emptyStateImage,
                title: emptyStateTitle,
                width: width,
                emptyStateButton: emptyStateButton,
              ),
      ],
    );
    // });
  }

  Widget _buildChild(LoadingState state) {
    if ((state == LoadingState.error && onRetry != null) ||
        (isTryAgain == true && onRetry != null && tryAgainWidget == null)) {
      return SizedBox(
        height: tryAgainContainerHeight ?? 0.85.sh,
        child: Center(
          child: TrayAgainButton(
            onPressed: onRetry!,
          ),
        ),
      );
    } else if (isTryAgain == true && tryAgainWidget != null) {
      return tryAgainWidget!;
    } else {
      return child;
    }
  }
}
