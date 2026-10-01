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

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.inventoryItems.map((item) {
      return [
        item['sku'],
        item['name'],
        item['category'],
        item['warehouse'],
        '${item['stockOnHand']} pcs',
        '${item['available']} pcs',
        item['unitCost'],
        AppStatusBadge(status: item['status'] as AppStatusType),
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
              title: 'Inventory Stock & Reorder Levels',
              subtitle: 'SKU valuation (FIFO), stock balances across plants, and automated reorder alerts',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'Stock'],
              actions: [
                AppButton(
                  label: 'Stock Adjustment',
                  icon: Icons.tune_rounded,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Transfer Stock',
                  icon: Icons.swap_horiz,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Search inventory by SKU, product title, warehouse zone...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['SKU Code', 'Description', 'Category', 'Warehouse', 'On Hand', 'Available', 'Unit Cost', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 1, 1, 1, 1],
              totalRecords: DemoDataStore.inventoryItems.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
