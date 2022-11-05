import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/constants/app_colors.dart';

enum StepsEnum {
  unknow,
  addressStep,
  feesStep,
  scheduleStep,
}

enum ProfilePublishedStatus {
  unknown,
  notPublished,
  pending,
  published,
  rejected
}

extension ProfileStatusExtention on ProfilePublishedStatus {
  String getName() {
    switch (this) {
      case ProfilePublishedStatus.notPublished:
        return "notPublished".tr;
      case ProfilePublishedStatus.pending:
        return "pending".tr;

      case ProfilePublishedStatus.published:
        return "published".tr;

      case ProfilePublishedStatus.rejected:
        return "rejected".tr;

      default:
        return "notPublished".tr;
    }
  }

  Color getColor() {
    switch (this) {
      case ProfilePublishedStatus.notPublished:
        return AppColors.squash;
      case ProfilePublishedStatus.pending:
        return AppColors.squash;

      case ProfilePublishedStatus.published:
        return AppColors.booger;

      case ProfilePublishedStatus.rejected:
        return AppColors.tomato;

      default:
        return AppColors.squash;
    }
  }

  IconData getIcon() {
    switch (this) {
      case ProfilePublishedStatus.notPublished:
        return Icons.circle;
      case ProfilePublishedStatus.pending:
        return Icons.circle;

      case ProfilePublishedStatus.published:
        return Icons.circle;

      case ProfilePublishedStatus.rejected:
        return Icons.contact_support_rounded;

      default:
        return Icons.circle;
    }
  }
}
