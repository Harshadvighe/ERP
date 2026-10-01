import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PAY-2026-09', 'September 2026 Monthly Payroll', '1,320 Employees', '\$4,890,200.00', '\$642,100.00', '\$4,248,100.00', AppStatusBadge(status: AppStatusType.completed)],
      ['PAY-2026-10', 'October 2026 Monthly Payroll', '1,320 Employees', '\$4,910,000.00', '\$648,000.00', '\$4,262,000.00', AppStatusBadge(status: AppStatusType.draft)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Payroll & Statutory Compliance',
              subtitle: 'Salary structures, tax deductions, pension contributions, automated bank direct deposits, and payslip distribution',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'Payroll'],
              actions: [
                AppButton(
                  label: 'Execute Payroll Run',
                  icon: Icons.payments_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Salary Structures',
                  icon: Icons.tune,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter payroll batches by period or status...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Payroll Batch Code', 'Pay Period Description', 'Headcount', 'Gross Earnings', 'Statutory Deductions', 'Net Payable', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 2, 1],
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
