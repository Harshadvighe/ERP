import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['RPT-FIN-01', 'Monthly Financial Balance Sheet & P&L Statement', 'Finance & Accounts', 'Monthly Automated', 'PDF / XLSX', 'Sept 30, 2026', AppStatusBadge(status: AppStatusType.completed)],
      ['RPT-PRD-02', 'Plant Production OEE & Machine Downtime Log', 'Manufacturing MES', 'Daily Shift End', 'PDF / CSV', 'Today 06:00 UTC', AppStatusBadge(status: AppStatusType.completed)],
      ['RPT-INV-03', 'Inventory FIFO Valuation & Slow-Moving Stock Audit', 'Inventory Control', 'Weekly', 'XLSX', 'Oct 01, 2026', AppStatusBadge(status: AppStatusType.completed)],
      ['RPT-QC-04', 'Quality Non-Conformance (NCR) & Defect Pareto', 'Quality Control', 'Monthly', 'PDF', 'Sept 30, 2026', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Reports Engine & Scheduled Analytics',
              subtitle: 'Custom business intelligence reports, automated PDF exports, and asynchronous BullMQ generation jobs',
              breadcrumbs: const ['ERP', 'Administration & System', 'Reports'],
              actions: [
                AppButton(
                  label: 'Generate Custom Report',
                  icon: Icons.assessment_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter report templates by module or frequency...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Report ID', 'Report Definition Title', 'Domain / Scope', 'Schedule Frequency', 'Formats Available', 'Last Generated', 'Status'],
              rows: rows,
              flexWeights: const [2, 4, 2, 2, 2, 2, 1],
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
