import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import 'app_button.dart';

class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final bool isDestructive;
  final VoidCallback onConfirm;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.isDestructive = false,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AppConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
        onConfirm: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.rLg),
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      child: Container(
        padding: AppSpacing.pLg,
        constraints: const BoxConstraints(maxWidth: 440),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (isDestructive ? AppColors.error : AppColors.primary).withValues(alpha: 0.1),
                    borderRadius: AppRadius.rSm,
                  ),
                  child: Icon(
                    isDestructive ? Icons.warning_amber_rounded : Icons.info_outline,
                    color: isDestructive ? AppColors.error : AppColors.primary,
                    size: 20,
                  ),
                ),
                AppSpacing.gapSm,
                Expanded(
                  child: Text(
                    title,
                    style: AppTextTheme.headingMedium.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            AppSpacing.gapMd,
            Text(
              message,
              style: AppTextTheme.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            AppSpacing.gapLg,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  label: cancelLabel,
                  variant: AppButtonVariant.secondary,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                AppSpacing.gapSm,
                AppButton(
                  label: confirmLabel,
                  variant: isDestructive ? AppButtonVariant.danger : AppButtonVariant.primary,
                  onPressed: onConfirm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
