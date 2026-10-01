import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/demo/demo_data_store.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ProductionScreen extends StatelessWidget {
  const ProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.productionOrders.map((p) {
      return [
        p['id'],
        p['product'],
        p['batchNo'],
        '${p['completedQty']} / ${p['plannedQty']} pcs',
        p['line'],
        p['targetDate'],
        AppStatusBadge(status: p['status'] as AppStatusType),
      ];
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Production Orders & Job Scheduling',
              subtitle: 'Shop floor job dispatches, material issue logs, cycle completions, and downtime tracking',
              breadcrumbs: const ['ERP', 'Manufacturing & Quality', 'Production Orders'],
              actions: [
                AppButton(
                  label: 'Launch Work Order',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Issue Raw Materials',
                  icon: Icons.input_rounded,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter production orders by PO#, product or assembly line...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Production Order', 'Assembly Target', 'Lot / Batch #', 'Progress (Yield)', 'Assigned Line', 'Target Date', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 2, 1],
              totalRecords: DemoDataStore.productionOrders.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
