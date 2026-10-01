import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../models/status_type.dart';

class AppStatusBadge extends StatelessWidget {
  final AppStatusType status;
  final String? customLabel;

  const AppStatusBadge({
    super.key,
    required this.status,
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: AppRadius.rRound,
        border: Border.all(color: status.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: status.textColor,
              shape: BoxShape.circle,
            ),
          ),
          AppSpacing.gapXs,
          Text(
            customLabel ?? status.label,
            style: AppTextTheme.labelSmall.copyWith(
              color: status.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
