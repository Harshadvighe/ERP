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

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.salesOrders.map((s) {
      return [
        s['id'],
        s['customer'],
        s['orderDate'],
        s['deliveryDate'],
        s['total'],
        s['fulfillment'],
        AppStatusBadge(status: s['status'] as AppStatusType),
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
              title: 'Sales Orders & Dispatch',
              subtitle: 'Commercial orders, production scheduling triggers, and delivery fulfillment',
              breadcrumbs: const ['ERP', 'CRM & Sales', 'Sales Orders'],
              actions: [
                AppButton(
                  label: 'New Sales Order',
                  icon: Icons.add_shopping_cart,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter sales orders by SO#, customer or delivery date...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['SO Number', 'Customer Account', 'Order Date', 'Delivery Date', 'Total Amount', 'Fulfillment', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 2, 1],
              totalRecords: DemoDataStore.salesOrders.length,
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
