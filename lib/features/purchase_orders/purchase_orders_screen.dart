import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class PurchaseOrdersScreen extends StatelessWidget {
  const PurchaseOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PO-7701', 'Siemens Industry Automation AG', '2026-09-24', '2026-10-08', '\$48,500.00', 'In Transit', AppStatusBadge(status: AppStatusType.running)],
      ['PO-7702', 'Sandvik Coromant Precision Tools', '2026-09-28', '2026-10-04', '\$12,400.00', '100% Received', AppStatusBadge(status: AppStatusType.completed)],
      ['PO-7703', 'Parker Hannifin Fluid Systems', '2026-10-01', '2026-10-18', '\$34,800.00', 'Pending Dispatch', AppStatusBadge(status: AppStatusType.approved)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Purchase Orders & Goods Receipt (GRN)',
              subtitle: 'Commercial vendor orders, warehouse receipting, and 3-way invoice matching',
              breadcrumbs: const ['ERP', 'Finance & Procurement', 'Purchase Orders'],
              actions: [
                AppButton(
                  label: 'Issue Purchase Order',
                  icon: Icons.add_shopping_cart,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Receive Goods (GRN)',
                  icon: Icons.input_rounded,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter purchase orders by PO#, vendor or delivery date...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['PO Number', 'Vendor / Supplier', 'Issue Date', 'Expected Date', 'Order Value', 'GRN Status', 'Status'],
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
