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

class InvoicingScreen extends StatelessWidget {
  const InvoicingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.invoices.map((inv) {
      return [
        inv['id'],
        inv['customer'],
        inv['issueDate'],
        inv['dueDate'],
        inv['amount'],
        inv['paidAmount'],
        AppStatusBadge(status: inv['status'] as AppStatusType),
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
              title: 'Customer Invoices & Payments',
              subtitle: 'Tax invoices, AR collections, aging analysis, and payment allocations',
              breadcrumbs: const ['ERP', 'Finance & Procurement', 'Invoices'],
              actions: [
                AppButton(
                  label: 'Generate Tax Invoice',
                  icon: Icons.receipt_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Record Payment',
                  icon: Icons.payment_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter invoices by number, client or payment status...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Invoice ID', 'Customer Account', 'Issue Date', 'Due Date', 'Total Invoiced', 'Amount Paid', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 2, 1],
              totalRecords: DemoDataStore.invoices.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
