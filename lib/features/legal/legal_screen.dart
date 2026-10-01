import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['CTR-2026-041', 'Master Supply & OEM Agreement', 'Apex Industrial Automation Ltd', 'Commercial Sales', '2026-01-01 - 2028-12-31', 'In Full Force', AppStatusBadge(status: AppStatusType.approved)],
      ['CTR-2026-042', 'Mutual Non-Disclosure Agreement (NDA)', 'Quantum Turbines Inc', 'Confidentiality', '2026-05-15 - 2029-05-14', 'Executed & Sealed', AppStatusBadge(status: AppStatusType.approved)],
      ['CTR-2026-043', 'Strategic Technology License Agreement', 'Siemens AG', 'IP & Technology', '2024-10-01 - 2027-09-30', 'Active License', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Legal Contracts & Regulatory Compliance',
              subtitle: 'Corporate agreements, vendor NDAs, intellectual property licensing, and regulatory compliance audits',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'Legal & Compliance'],
              actions: [
                AppButton(
                  label: 'Execute Contract',
                  icon: Icons.gavel_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter contracts by counterparty, type or reference...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Contract Code', 'Agreement Title', 'Counterparty Legal Name', 'Legal Domain', 'Term / Validity', 'Legal Status', 'Status'],
              rows: rows,
              flexWeights: const [2, 4, 3, 2, 3, 2, 1],
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
