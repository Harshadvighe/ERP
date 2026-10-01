import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['WH-PLANT-01-A', 'Main Raw Materials Warehouse', 'Plant 1', 'Zone A-D (Aisles 1-20)', '8,400 m²', '84.2% Occupied', AppStatusBadge(status: AppStatusType.active)],
      ['WH-PLANT-01-B', 'Electronics & Cleanroom Store', 'Plant 1', 'Zone E (ESD Safe)', '1,200 m²', '62.5% Occupied', AppStatusBadge(status: AppStatusType.active)],
      ['WH-PLANT-02-FG', 'Finished Goods Distribution Center', 'Plant 2', 'High-Bay Automated Racks', '12,000 m²', '91.0% Occupied', AppStatusBadge(status: AppStatusType.active)],
      ['WH-SCRAP-03', 'Scrap & Material Recovery Yard', 'Plant 1', 'Yard South', '3,000 m²', '45.0% Occupied', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Warehouse, Zones & Bin Locations',
              subtitle: 'Aisle, rack, and bin level tracking, temperature monitored zones, and capacity metrics',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'Warehouses'],
              actions: [
                AppButton(
                  label: 'Add Warehouse Zone',
                  icon: Icons.add_home_work_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter warehouses by code, plant or location...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Warehouse ID', 'Facility Name', 'Plant Allocation', 'Racks & Zones', 'Floor Area', 'Utilization', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 3, 1, 2, 1],
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
