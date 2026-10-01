import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['VND-001', 'Siemens Industry Automation AG', 'Munich, Germany', 'Hans Zimmer', 'Direct OEM Supplier', '4.9 ★', AppStatusBadge(status: AppStatusType.active)],
      ['VND-002', 'Sandvik Coromant Precision Tools', 'Sandviken, Sweden', 'Erik Larsson', 'Cutting & Milling Tools', '4.8 ★', AppStatusBadge(status: AppStatusType.active)],
      ['VND-003', 'Parker Hannifin Fluid Systems', 'Cleveland, USA', 'Rachel Green', 'Hydraulics & Seals', '4.7 ★', AppStatusBadge(status: AppStatusType.active)],
      ['VND-004', 'Schneider Electric Energy', 'Rueil, France', 'Jean Pierre', 'Switchgear & VFDs', '4.5 ★', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Suppliers & Vendor Registry',
              subtitle: 'Approved vendor list, vendor compliance ratings, and contract agreements',
              breadcrumbs: const ['ERP', 'Finance & Procurement', 'Suppliers'],
              actions: [
                AppButton(
                  label: 'Add Supplier',
                  icon: Icons.domain_add_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Search suppliers by name, category or location...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Vendor Code', 'Supplier Name', 'Headquarters', 'Key Account Rep', 'Supply Scope', 'Rating', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 3, 1, 1],
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
