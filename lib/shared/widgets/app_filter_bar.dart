import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import 'app_text_field.dart';
import 'app_button.dart';

class AppFilterBar extends StatelessWidget {
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onExportPressed;
  final VoidCallback? onAddPressed;
  final String addLabel;
  final List<Widget>? customFilters;

  const AppFilterBar({
    super.key,
    this.searchHint = 'Search records...',
    this.onSearchChanged,
    this.onFilterPressed,
    this.onExportPressed,
    this.onAddPressed,
    this.addLabel = 'Create New',
    this.customFilters,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 650;

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSearchField(
                hint: searchHint,
                onChanged: onSearchChanged,
              ),
              AppSpacing.gapSm,
              Row(
                children: [
                  if (onFilterPressed != null)
                    Expanded(
                      child: AppButton(
                        label: 'Filters',
                        icon: Icons.filter_list,
                        variant: AppButtonVariant.secondary,
                        onPressed: onFilterPressed,
                      ),
                    ),
                  if (onFilterPressed != null && onExportPressed != null) AppSpacing.gapSm,
                  if (onExportPressed != null)
                    Expanded(
                      child: AppButton(
                        label: 'Export',
                        icon: Icons.download_outlined,
                        variant: AppButtonVariant.secondary,
                        onPressed: onExportPressed,
                      ),
                    ),
                ],
              ),
              if (onAddPressed != null) ...[
                AppSpacing.gapSm,
                AppButton(
                  label: addLabel,
                  icon: Icons.add,
                  variant: AppButtonVariant.primary,
                  onPressed: onAddPressed,
                  isFullWidth: true,
                ),
              ],
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: AppSearchField(
                hint: searchHint,
                onChanged: onSearchChanged,
              ),
            ),
            AppSpacing.gapSm,
            if (customFilters != null) ...[
              for (final filter in customFilters!) ...[
                filter,
                AppSpacing.gapSm,
              ],
            ],
            if (onFilterPressed != null) ...[
              AppButton(
                label: 'Filters',
                icon: Icons.filter_list,
                variant: AppButtonVariant.secondary,
                onPressed: onFilterPressed,
              ),
              AppSpacing.gapSm,
            ],
            if (onExportPressed != null) ...[
              AppButton(
                label: 'Export',
                icon: Icons.download_outlined,
                variant: AppButtonVariant.secondary,
                onPressed: onExportPressed,
              ),
              AppSpacing.gapSm,
            ],
            if (onAddPressed != null)
              AppButton(
                label: addLabel,
                icon: Icons.add,
                variant: AppButtonVariant.primary,
                onPressed: onAddPressed,
              ),
          ],
        );
      },
    );
  }
}
