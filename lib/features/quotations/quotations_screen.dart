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

class QuotationsScreen extends StatelessWidget {
  const QuotationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.quotations.map((q) {
      return [
        q['id'],
        q['customer'],
        q['date'],
        '${q['itemsCount']} Items',
        q['amount'],
        q['validUntil'],
        AppStatusBadge(status: q['status'] as AppStatusType),
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
              title: 'Quotations & Price Estimates',
              subtitle: 'Multi-currency quotations, discount approvals, and conversion to sales orders',
              breadcrumbs: const ['ERP', 'CRM & Sales', 'Quotations'],
              actions: [
                AppButton(
                  label: 'Create Quotation',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter quotations by reference, customer or date...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Quote #', 'Customer', 'Quote Date', 'Line Items', 'Net Amount', 'Valid Until', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 1, 2, 2, 1],
              totalRecords: DemoDataStore.quotations.length,
              onView: (idx) {},
              onEdit: (idx) {},
              onDelete: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
