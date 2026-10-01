import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/responsive/responsive_layout.dart';
import 'app_card.dart';
import 'app_button.dart';

class AppDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<dynamic>> rows;
  final List<int>? flexWeights;
  final Function(int rowIndex)? onView;
  final Function(int rowIndex)? onEdit;
  final Function(int rowIndex)? onDelete;
  final int currentPage;
  final int totalPages;
  final int totalRecords;
  final ValueChanged<int>? onPageChanged;
  final Widget? emptyWidget;

  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.flexWeights,
    this.onView,
    this.onEdit,
    this.onDelete,
    this.currentPage = 1,
    this.totalPages = 1,
    this.totalRecords = 0,
    this.onPageChanged,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty && emptyWidget != null) {
      return emptyWidget!;
    }

    final isMobile = ResponsiveLayout.isMobile(context);

    if (isMobile) {
      return _buildMobileCards(context);
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.md)),
              border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
            ),
            child: Row(
              children: [
                for (int i = 0; i < columns.length; i++) ...[
                  Expanded(
                    flex: flexWeights != null && i < flexWeights!.length ? flexWeights![i] : 1,
                    child: Text(
                      columns[i].toUpperCase(),
                      style: AppTextTheme.labelSmall.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
                if (onView != null || onEdit != null || onDelete != null)
                  const SizedBox(
                    width: 140,
                    child: Text(
                      'ACTIONS',
                      textAlign: TextAlign.end,
                      style: AppTextTheme.labelSmall,
                    ),
                  ),
              ],
            ),
          ),

          // Table Rows
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: rows.length,
            separatorBuilder: (_, _) => const Divider(height: 1, color: AppColors.borderSubtle),
            itemBuilder: (context, rowIndex) {
              final row = rows[rowIndex];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
                color: rowIndex % 2 == 0 ? AppColors.surface : AppColors.background.withValues(alpha: 0.4),
                child: Row(
                  children: [
                    for (int colIndex = 0; colIndex < row.length; colIndex++) ...[
                      Expanded(
                        flex: flexWeights != null && colIndex < flexWeights!.length
                            ? flexWeights![colIndex]
                            : 1,
                        child: _renderCell(row[colIndex]),
                      ),
                    ],
                    if (onView != null || onEdit != null || onDelete != null)
                      SizedBox(
                        width: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (onView != null)
                              IconButton(
                                icon: const Icon(Icons.visibility_outlined, size: 18),
                                color: AppColors.textSecondary,
                                tooltip: 'View',
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(4),
                                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                onPressed: () => onView!(rowIndex),
                              ),
                            if (onEdit != null) ...[
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, size: 18),
                                color: AppColors.primaryDark,
                                tooltip: 'Edit',
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(4),
                                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                onPressed: () => onEdit!(rowIndex),
                              ),
                            ],
                            if (onDelete != null) ...[
                              const SizedBox(width: 4),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 18),
                                color: AppColors.error,
                                tooltip: 'Delete',
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.all(4),
                                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                                onPressed: () => onDelete!(rowIndex),
                              ),
                            ],
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          // Pagination Footer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppRadius.md)),
              border: Border(top: BorderSide(color: AppColors.border, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Showing ${rows.length} of $totalRecords entries',
                  style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                Row(
                  children: [
                    AppButton(
                      label: 'Previous',
                      variant: AppButtonVariant.secondary,
                      height: 32,
                      onPressed: currentPage > 1 && onPageChanged != null
                          ? () => onPageChanged!(currentPage - 1)
                          : null,
                    ),
                    AppSpacing.gapSm,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: AppRadius.rSm,
                        border: Border.all(color: AppColors.primaryBorder),
                      ),
                      child: Text(
                        '$currentPage / $totalPages',
                        style: AppTextTheme.labelMedium.copyWith(color: AppColors.primaryDark),
                      ),
                    ),
                    AppSpacing.gapSm,
                    AppButton(
                      label: 'Next',
                      variant: AppButtonVariant.secondary,
                      height: 32,
                      onPressed: currentPage < totalPages && onPageChanged != null
                          ? () => onPageChanged!(currentPage + 1)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCards(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < rows.length; i++) ...[
          AppCard(
            padding: AppSpacing.pMd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int j = 0; j < columns.length && j < rows[i].length; j++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        columns[j],
                        style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Flexible(child: _renderCell(rows[i][j])),
                    ],
                  ),
                  if (j < columns.length - 1) const SizedBox(height: 6),
                ],
                if (onView != null || onEdit != null || onDelete != null) ...[
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (onView != null)
                        TextButton.icon(
                          icon: const Icon(Icons.visibility_outlined, size: 16),
                          label: const Text('View'),
                          onPressed: () => onView!(i),
                        ),
                      if (onEdit != null)
                        TextButton.icon(
                          icon: const Icon(Icons.edit_outlined, size: 16),
                          label: const Text('Edit'),
                          onPressed: () => onEdit!(i),
                        ),
                      if (onDelete != null)
                        TextButton.icon(
                          icon: const Icon(Icons.delete_outline, size: 16, color: AppColors.error),
                          label: const Text('Delete', style: TextStyle(color: AppColors.error)),
                          onPressed: () => onDelete!(i),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          AppSpacing.gapSm,
        ],
      ],
    );
  }

  Widget _renderCell(dynamic cellData) {
    if (cellData is Widget) {
      return cellData;
    }
    return Text(
      cellData?.toString() ?? '-',
      style: AppTextTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
