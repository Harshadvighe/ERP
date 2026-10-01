import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['ORG-HQ-01', 'Company Industrial Holdings Global', 'Corporate Headquarters', 'Delaware, USA', 'USD (\$)', '100% Parent', AppStatusBadge(status: AppStatusType.active)],
      ['PLANT-01-ALPHA', 'Plant 1: Advanced Machining & Assembly Complex', 'Manufacturing Plant', 'Detroit, Michigan, USA', 'USD (\$)', 'Cost Center: CC-100', AppStatusBadge(status: AppStatusType.active)],
      ['PLANT-02-BETA', 'Plant 2: Cleanroom & Electronics Sub-Assembly', 'Manufacturing Plant', 'Stuttgart, Germany', 'EUR (€)', 'Cost Center: CC-200', AppStatusBadge(status: AppStatusType.active)],
      ['BRANCH-APAC-03', 'APAC Regional Distribution & Support Hub', 'Logistics & Sales Hub', 'Singapore', 'SGD (S\$)', 'Cost Center: CC-300', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Multi-Entity Organization & Plant Hierarchy',
              subtitle: 'Multi-company legal entities, manufacturing plant locations, branch offices, and fiscal cost centers',
              breadcrumbs: const ['ERP', 'Administration & System', 'Organization'],
              actions: [
                AppButton(
                  label: 'Add Plant / Branch',
                  icon: Icons.add_business,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Entity Code', 'Entity Legal Name', 'Facility Category', 'Geographic Location', 'Base Currency', 'Cost Center Mapping', 'Status'],
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
