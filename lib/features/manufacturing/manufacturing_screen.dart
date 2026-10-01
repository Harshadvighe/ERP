import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ManufacturingScreen extends StatelessWidget {
  const ManufacturingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['WC-MACH-01', 'Heavy 5-Axis CNC Milling Cell', 'Plant 1 - Bay A', 'DMG Mori DuoBlock (x2)', '160 hrs/wk', '92% Capacity', AppStatusBadge(status: AppStatusType.active)],
      ['WC-WELD-02', 'Automated Robotic Arc Welding Station', 'Plant 1 - Bay C', 'KUKA KR-210 Cell', '120 hrs/wk', '85% Capacity', AppStatusBadge(status: AppStatusType.active)],
      ['WC-ASSY-03', 'Precision Cleanroom Electro-Assembly', 'Plant 2 - Cleanroom', 'ESD Workbenches (x12)', '80 hrs/wk', '74% Capacity', AppStatusBadge(status: AppStatusType.active)],
      ['WC-TEST-04', 'High-Pressure Hydraulic Proof Test Bay', 'Plant 1 - QC Yard', 'Test Rig 600 Bar', '40 hrs/wk', '45% Capacity', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Manufacturing Execution (MES) & Work Centers',
              subtitle: 'Shop floor routing definitions, standard labor/machine hourly rates, and capacity allocation',
              breadcrumbs: const ['ERP', 'Manufacturing & Quality', 'MES Work Centers'],
              actions: [
                AppButton(
                  label: 'Add Work Center',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter work centers by code, name or plant bay...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Work Center Code', 'Work Center Name', 'Location', 'Machine / Resource Assigned', 'Available Shift Hours', 'Current Load', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 3, 2, 2, 1],
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
