import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['1001-00', 'Cash & Bank Operating Accounts', 'Asset', '\$1,842,500.00', 'Debit', AppStatusBadge(status: AppStatusType.active)],
      ['1200-00', 'Accounts Receivable (Trade Debtors)', 'Asset', '\$617,100.00', 'Debit', AppStatusBadge(status: AppStatusType.active)],
      ['1400-00', 'Raw Materials & Components Stock', 'Asset', '\$3,120,400.00', 'Debit', AppStatusBadge(status: AppStatusType.active)],
      ['2000-00', 'Accounts Payable (Trade Creditors)', 'Liability', '\$488,900.00', 'Credit', AppStatusBadge(status: AppStatusType.active)],
      ['4000-00', 'Gross Industrial Sales Revenue', 'Revenue', '\$14,250,000.00', 'Credit', AppStatusBadge(status: AppStatusType.active)],
      ['5000-00', 'Direct Manufacturing & Labor Costs', 'Expense', '\$8,940,200.00', 'Debit', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'General Ledger & Chart of Accounts',
              subtitle: 'Financial statements, journal entries, balance sheet, and double-entry accounting',
              breadcrumbs: const ['ERP', 'Finance & Procurement', 'General Ledger'],
              actions: [
                AppButton(
                  label: 'Post Journal Entry',
                  icon: Icons.note_add_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Trial Balance',
                  icon: Icons.account_balance,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter accounts by code, name or class...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Account Code', 'Account Name', 'Category', 'Current Balance', 'Normal Balance', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 1],
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
