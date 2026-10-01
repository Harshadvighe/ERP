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

class HrScreen extends StatelessWidget {
  const HrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.employees.map((e) {
      return [
        e['id'],
        e['name'],
        e['role'],
        e['department'],
        e['email'],
        e['phone'],
        AppStatusBadge(status: e['status'] as AppStatusType),
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
              title: 'Human Resources (HR) & Employee Master',
              subtitle: 'Employee profiles, department structures, designations, onboarding docs, and talent directory',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'HR Directory'],
              actions: [
                AppButton(
                  label: 'Onboard Employee',
                  icon: Icons.person_add_alt_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Department Org Chart',
                  icon: Icons.account_tree_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter employees by name, department, ID, or job title...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Emp ID', 'Full Name', 'Job Designation', 'Department', 'Company Email', 'Phone', 'Status'],
              rows: rows,
              flexWeights: const [1, 2, 3, 2, 2, 2, 1],
              totalRecords: DemoDataStore.employees.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
