import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';

class AppNotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isUnread;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const AppNotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
    this.icon = Icons.notifications_outlined,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = iconColor ?? AppColors.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.rMd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
        decoration: BoxDecoration(
          color: isUnread ? AppColors.primaryLight.withValues(alpha: 0.3) : Colors.transparent,
          borderRadius: AppRadius.rMd,
          border: isUnread
              ? const Border(left: BorderSide(color: AppColors.primary, width: 3))
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: effectiveColor.withValues(alpha: 0.1),
                borderRadius: AppRadius.rSm,
              ),
              child: Icon(icon, size: 18, color: effectiveColor),
            ),
            AppSpacing.gapMd,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextTheme.labelMedium.copyWith(
                            fontWeight: isUnread ? FontWeight.w700 : FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        time,
                        style: AppTextTheme.bodySmall.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    message,
                    style: AppTextTheme.bodySmall.copyWith(
                      color: isUnread ? AppColors.textPrimary : AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
