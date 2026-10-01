import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class RolesScreen extends StatelessWidget {
  const RolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['ROLE-SUPER-ADMIN', 'Super Administrator', 'Full System Unrestricted Access', '4 Users Assigned', 'All 142 Permissions', AppStatusBadge(status: AppStatusType.active)],
      ['ROLE-PLANT-MGR', 'Plant Operations Manager', 'Manufacturing, MES, Maintenance, Safety & Quality', '12 Users Assigned', '84 Permissions', AppStatusBadge(status: AppStatusType.active)],
      ['ROLE-FINANCE-HEAD', 'Chief Financial Officer / Head of Finance', 'General Ledger, Invoicing, Payments, Audit & Tax', '8 Users Assigned', '62 Permissions', AppStatusBadge(status: AppStatusType.active)],
      ['ROLE-OPERATOR', 'Shop Floor Machine Operator', 'Work Order Execution, Machine Run Log & QC Check', '450 Users Assigned', '18 Permissions', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Role-Based Access Control (RBAC) & Policies',
              subtitle: 'Security role definitions, granular policy builder, and hierarchical inheritance matrix',
              breadcrumbs: const ['ERP', 'Administration & System', 'Roles & RBAC'],
              actions: [
                AppButton(
                  label: 'Define New Role',
                  icon: Icons.shield_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Role Identifier', 'Role Display Name', 'Permission Scope Description', 'Active Members', 'Permission Count', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 4, 2, 2, 1],
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
