import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class BomScreen extends StatelessWidget {
  const BomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['BOM-X6-REV4', 'PRD-ARM-X6 (6-Axis Robot Arm)', 'Rev 4.2', '48 Components (4 Sub-BOMs)', '14.5 Hours', '\$18,450.00', AppStatusBadge(status: AppStatusType.approved)],
      ['BOM-SP-REV2', 'PRD-SPINDLE-B (CNC Spindle Head)', 'Rev 2.0', '22 Components', '6.0 Hours', '\$5,820.00', AppStatusBadge(status: AppStatusType.approved)],
      ['BOM-HYD-REV1', 'PRD-HYD-VALVE (Hydraulic Block)', 'Rev 1.1', '14 Components', '3.5 Hours', '\$2,100.00', AppStatusBadge(status: AppStatusType.approved)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Bill of Materials (BOM) & Engineering Structure',
              subtitle: 'Multi-level engineering trees, routing operations, component standard costs, and scrap factor allowances',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'BOM'],
              actions: [
                AppButton(
                  label: 'Create BOM Revision',
                  icon: Icons.account_tree_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter BOMs by code, parent product or revision...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['BOM Code', 'Finished Product', 'Revision', 'Component Breakdown', 'Mfg Cycle Time', 'Standard Material Cost', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 1, 3, 2, 2, 1],
              totalRecords: rows.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
