import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['admin@company-erp.com', 'Marcus Vance', 'Super Administrator', 'Corporate IT & Executive', 'MFA Enforced (Hardware FIDO2)', '2026-10-01 13:20', AppStatusBadge(status: AppStatusType.active)],
      ['e.rostova@company-erp.com', 'Elena Rostova', 'Sales VP / Commercial Director', 'Sales & CRM', 'MFA Enforced (TOTP)', '2026-10-01 12:45', AppStatusBadge(status: AppStatusType.active)],
      ['m.brody@company-erp.com', 'Marcus Brody', 'Operations Director', 'Manufacturing MES', 'MFA Enforced (TOTP)', '2026-10-01 11:30', AppStatusBadge(status: AppStatusType.active)],
      ['operator@company-erp.com', 'Plant Floor Operator 1', 'Machine Operator & Quality', 'Plant 1 - Machining', 'Standard Passcode', '2026-10-01 08:00', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'User Accounts & Security Credentials',
              subtitle: 'Enterprise user directory, MFA provisioning, active sessions, and password security policies',
              breadcrumbs: const ['ERP', 'Administration & System', 'Users'],
              actions: [
                AppButton(
                  label: 'Invite User',
                  icon: Icons.person_add_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['User Email (Login)', 'Full Legal Name', 'Assigned Security Role', 'Department Scope', '2FA / MFA Security', 'Last Active (UTC)', 'Account Status'],
              rows: rows,
              flexWeights: const [3, 2, 2, 2, 2, 2, 1],
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
