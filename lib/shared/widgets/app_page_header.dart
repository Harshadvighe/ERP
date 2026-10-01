import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

class AppPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final List<String>? breadcrumbs;

  const AppPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.breadcrumbs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (breadcrumbs != null && breadcrumbs!.isNotEmpty) ...[
          Row(
            children: [
              for (int i = 0; i < breadcrumbs!.length; i++) ...[
                Text(
                  breadcrumbs![i],
                  style: AppTextTheme.bodySmall.copyWith(
                    color: i == breadcrumbs!.length - 1 ? AppColors.textPrimary : AppColors.textMuted,
                    fontWeight: i == breadcrumbs!.length - 1 ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                if (i < breadcrumbs!.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(Icons.chevron_right, size: 14, color: AppColors.textMuted),
                  ),
              ],
            ],
          ),
          AppSpacing.gapXs,
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextTheme.headingLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (subtitle != null) ...[
                    AppSpacing.gapXxs,
                    Text(
                      subtitle!,
                      style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ],
              ),
            ),
            if (actions != null && actions!.isNotEmpty)
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: actions!,
              ),
          ],
        ),
      ],
    );
  }
}
