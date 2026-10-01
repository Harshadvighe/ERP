import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['TSK-401', 'Finalize Siemens S7-1500 PLC Tag Address Table', 'PRJ-MES-02', 'Marcus Vance', 'CRITICAL', 'Due Today', AppStatusBadge(status: AppStatusType.running)],
      ['TSK-402', 'Conduct High-Pressure Hydraulic Burst Test on Prototype Block', 'PRJ-AUT-01', 'Arthur Pendelton', 'HIGH', 'Due Oct 04', AppStatusBadge(status: AppStatusType.pending)],
      ['TSK-403', 'Review Q3 Financial Ledger Trial Balance with Auditors', 'Corporate', 'Sophia Chen', 'MEDIUM', 'Due Oct 08', AppStatusBadge(status: AppStatusType.pending)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Task Management & Action Items',
              subtitle: 'Operational assignments, priority tracking, cross-functional dependencies, and due date alerts',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'Tasks'],
              actions: [
                AppButton(
                  label: 'Assign Task',
                  icon: Icons.add,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter tasks by title, project, assignee or priority...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Task ID', 'Action Item Description', 'Parent Project', 'Assignee', 'Priority Level', 'Due Date', 'Status'],
              rows: rows,
              flexWeights: const [1, 4, 2, 2, 1, 2, 1],
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
