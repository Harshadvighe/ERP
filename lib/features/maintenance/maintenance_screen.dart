import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['MNT-WO-101', 'DMG Mori 5-Axis Milling Center', 'PREVENTIVE', '500-Hr Spindle Lubrication & Backlash Calib', 'Arthur Pendelton', 'Due: Oct 04, 2026', AppStatusBadge(status: AppStatusType.pending)],
      ['MNT-WO-102', 'Schuler 400T Hydraulic Press', 'CORRECTIVE', 'Hydraulic Proportional Valve Replacement', 'Marcus Brody', 'In Progress', AppStatusBadge(status: AppStatusType.maintenance)],
      ['MNT-WO-103', 'KUKA KR-210 Robotic Arm', 'PREDICTIVE', 'Harmonic Drive Grease Analysis & Vibration Check', 'Alexander Wright', 'Completed (All OK)', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Total Productive Maintenance (TPM) & Work Orders',
              subtitle: 'Preventive schedules, breakdown tickets, spare part consumption, and MTBF / MTTR analytics',
              breadcrumbs: const ['ERP', 'Manufacturing & Quality', 'Maintenance'],
              actions: [
                AppButton(
                  label: 'New Maintenance Order',
                  icon: Icons.build_circle_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Spare Parts Requisition',
                  icon: Icons.inventory_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter maintenance orders by work order#, machine, or technician...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Work Order #', 'Target Machinery', 'Maintenance Type', 'Scope of Work', 'Lead Engineer', 'Schedule Status', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 4, 2, 2, 1],
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
