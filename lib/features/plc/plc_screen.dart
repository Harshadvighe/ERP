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

class PlcScreen extends StatelessWidget {
  const PlcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.plcTags.map((t) {
      return [
        t['tag'],
        t['name'],
        t['type'],
        t['value'],
        t['quality'],
        AppStatusBadge(status: t['status'] as AppStatusType),
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
              title: 'PLC / SCADA Control & Live Data Blocks',
              subtitle: 'Siemens S7, Modbus-TCP, and OPC-UA live tag registers, polling rates, and safety loop status',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'PLC Tags'],
              actions: [
                AppButton(
                  label: 'Poll Tags Now',
                  icon: Icons.refresh,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Add Tag Definition',
                  icon: Icons.add,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter tags by DB address, name or data type...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['PLC Memory Tag / DB Address', 'Tag Symbolic Name', 'Data Type', 'Live Process Value', 'Signal Quality', 'Comm Status'],
              rows: rows,
              flexWeights: const [2, 3, 1, 2, 1, 1],
              totalRecords: DemoDataStore.plcTags.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
