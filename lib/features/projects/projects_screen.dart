import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PRJ-AUT-01', 'Automated Battery Pack Assembly Line for EV Client', 'Alexander Wright', 'Engineering', '\$1,450,000', '78% Complete', AppStatusBadge(status: AppStatusType.running)],
      ['PRJ-MES-02', 'Plant 2 MES Gateway & Telemetry Upgrade', 'Marcus Vance', 'IT & Automation', '\$220,000', '95% Complete', AppStatusBadge(status: AppStatusType.running)],
      ['PRJ-CNC-03', 'DMG Mori Precision 5-Axis Commissioning', 'Arthur Pendelton', 'Operations', '\$680,000', '100% Commissioned', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Projects & Capital Expenditure (CapEx)',
              subtitle: 'Multi-disciplinary project tracking, milestones, budget variance, and engineering deliverables',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'Projects'],
              actions: [
                AppButton(
                  label: 'Initiate Project',
                  icon: Icons.add_task,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter projects by code, lead engineer or department...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Project Code', 'Project Title', 'Project Director', 'Department', 'Approved Budget', 'Deliverables Progress', 'Status'],
              rows: rows,
              flexWeights: const [2, 4, 2, 2, 2, 2, 1],
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
