import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PRD-ARM-X6', '6-Axis Industrial Articulated Robot Arm X6', 'Robotics & Automation', 'Assembly', 'EA', '\$42,500.00', AppStatusBadge(status: AppStatusType.active)],
      ['PRD-SPINDLE-B', 'High-Speed CNC Spindle Head 24,000 RPM', 'Machining Sub-Assemblies', 'Precision Machining', 'EA', '\$12,800.00', AppStatusBadge(status: AppStatusType.active)],
      ['PRD-HYD-VALVE', 'Hydraulic Proportional Flow Control Block', 'Hydraulic Systems', 'Assembly', 'SET', '\$4,650.00', AppStatusBadge(status: AppStatusType.active)],
      ['PRD-CONTROL-PNL', 'Standardized IP65 Automation Control Enclosure', 'Electrical Enclosures', 'Fabrication', 'EA', '\$8,900.00', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Product Catalog & Master SKUs',
              subtitle: 'Finished industrial machinery, sub-assemblies, variants, price matrices, and engineering specs',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'Products'],
              actions: [
                AppButton(
                  label: 'Add Product SKU',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Search product master by code, title or category...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Product Code', 'Product Description', 'Product Family', 'Mfg Route', 'UOM', 'Base Price', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 1, 2, 1],
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
