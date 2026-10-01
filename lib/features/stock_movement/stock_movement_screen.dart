import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class StockMovementScreen extends StatelessWidget {
  const StockMovementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['MOV-9901', 'INBOUND_GRN', 'SKU-SERVO-8800', '+50 pcs', 'Sandvik Coromant', 'WH-Plant 1 A', '2026-10-01 10:14', AppStatusBadge(status: AppStatusType.completed)],
      ['MOV-9902', 'PROD_ISSUE', 'SKU-PLC-S7-1500', '-2 pcs', 'WH-Electronics B', 'Line 01 Assembly', '2026-10-01 11:30', AppStatusBadge(status: AppStatusType.completed)],
      ['MOV-9903', 'PLANT_TRANSFER', 'SKU-BRG-CERAMIC-45', '100 pcs', 'WH-Plant 1 A', 'WH-Plant 2 FG', '2026-10-01 12:45', AppStatusBadge(status: AppStatusType.running)],
      ['MOV-9904', 'PHYSICAL_ADJUST', 'SKU-VFD-ABB-580', '-1 pcs (Defect)', 'WH-Plant 1 A', 'QC Quarantine', '2026-09-30 16:00', AppStatusBadge(status: AppStatusType.approved)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Stock Movements & Material Audit',
              subtitle: 'Inbound receipts, production line issue notes, warehouse transfers, and physical cycle counts',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'Stock Movements'],
              actions: [
                AppButton(
                  label: 'Log Movement',
                  icon: Icons.swap_horiz,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter movements by reference, SKU, or movement type...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Movement ID', 'Type', 'Item SKU', 'Quantity', 'Source Location', 'Destination', 'Timestamp', 'Status'],
              rows: rows,
              flexWeights: const [2, 2, 2, 2, 2, 2, 2, 1],
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
