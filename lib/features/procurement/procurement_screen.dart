import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ProcurementScreen extends StatelessWidget {
  const ProcurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PR-8801', 'CNC Tooling & Solid Carbide Endmills', 'Manufacturing Cell 1', 'Elena Rostova', '2026-10-01', '\$14,500', AppStatusBadge(status: AppStatusType.approved)],
      ['PR-8802', 'Siemens PLC Digital Input Modules (x10)', 'Plant Automation', 'Marcus Vance', '2026-10-01', '\$8,200', AppStatusBadge(status: AppStatusType.pending)],
      ['PR-8803', 'Hydraulic Oil ISO VG 46 (2000L Drum)', 'Maintenance Dept', 'Arthur Pendelton', '2026-09-30', '\$6,400', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Procurement & Purchase Requisitions',
              subtitle: 'Material demand planning, RFQ vendor bidding, and requisition approval workflows',
              breadcrumbs: const ['ERP', 'Finance & Procurement', 'Procurement'],
              actions: [
                AppButton(
                  label: 'Create Requisition',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter purchase requisitions by PR#, item or requestor...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['PR Number', 'Description / Items', 'Department', 'Requested By', 'Date', 'Est. Value', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 1, 1],
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
