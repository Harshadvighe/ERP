import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum AppStatusType {
  active('ACTIVE', AppColors.success, AppColors.successLight, AppColors.successBorder),
  inactive('INACTIVE', AppColors.textSecondary, AppColors.surfaceHover, AppColors.border),
  pending('PENDING', AppColors.warning, AppColors.warningLight, AppColors.warningBorder),
  approved('APPROVED', AppColors.success, AppColors.successLight, AppColors.successBorder),
  rejected('REJECTED', AppColors.error, AppColors.errorLight, AppColors.errorBorder),
  draft('DRAFT', AppColors.info, AppColors.infoLight, AppColors.infoBorder),
  completed('COMPLETED', AppColors.success, AppColors.successLight, AppColors.successBorder),
  cancelled('CANCELLED', AppColors.error, AppColors.errorLight, AppColors.errorBorder),
  running('RUNNING', AppColors.success, AppColors.successLight, AppColors.successBorder),
  idle('IDLE', AppColors.warning, AppColors.warningLight, AppColors.warningBorder),
  fault('FAULT', AppColors.error, AppColors.errorLight, AppColors.errorBorder),
  offline('OFFLINE', AppColors.textSecondary, AppColors.surfaceHover, AppColors.border),
  online('ONLINE', AppColors.teal, AppColors.tealLight, AppColors.infoBorder),
  maintenance('MAINTENANCE', AppColors.purple, AppColors.purpleLight, AppColors.border);

  final String label;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  const AppStatusType(this.label, this.textColor, this.backgroundColor, this.borderColor);
}

class TableColumnData {
  final String label;
  final String key;
  final int flex;
  final bool numeric;

  const TableColumnData({
    required this.label,
    required this.key,
    this.flex = 1,
    this.numeric = false,
  });
}
