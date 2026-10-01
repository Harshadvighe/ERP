import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';

enum AppButtonVariant { primary, secondary, outline, danger, text }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final double? height;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = false,
    this.height = 42,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    BorderSide border;

    switch (variant) {
      case AppButtonVariant.primary:
        bg = AppColors.primary;
        fg = AppColors.textInverse;
        border = BorderSide.none;
        break;
      case AppButtonVariant.secondary:
        bg = AppColors.surfaceHover;
        fg = AppColors.textPrimary;
        border = const BorderSide(color: AppColors.border);
        break;
      case AppButtonVariant.outline:
        bg = Colors.transparent;
        fg = AppColors.primaryDark;
        border = const BorderSide(color: AppColors.primary, width: 1.5);
        break;
      case AppButtonVariant.danger:
        bg = AppColors.error;
        fg = AppColors.textInverse;
        border = BorderSide.none;
        break;
      case AppButtonVariant.text:
        bg = Colors.transparent;
        fg = AppColors.primaryDark;
        border = BorderSide.none;
        break;
    }

    Widget content = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(fg),
            ),
          ),
          AppSpacing.gapSm,
        ] else if (icon != null) ...[
          Icon(icon, size: 18, color: fg),
          AppSpacing.gapSm,
        ],
        Text(
          label,
          style: AppTextTheme.labelLarge.copyWith(color: fg),
        ),
      ],
    );

    return SizedBox(
      height: height,
      width: isFullWidth ? double.infinity : null,
      child: Material(
        color: onPressed == null ? AppColors.border : bg,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.rMd,
          side: border,
        ),
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: AppRadius.rMd,
          hoverColor: AppColors.primaryLight.withValues(alpha: 0.2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}
