import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class RndScreen extends StatelessWidget {
  const RndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['ECO-2026-088', 'Ceramic Bearing Upgrade for Spindle Model B', 'PRD-SPINDLE-B', 'Engineering Change Order', 'Dr. Aris Thorne', 'Under Simulation', AppStatusBadge(status: AppStatusType.pending)],
      ['ECO-2026-087', 'High-Yield Titanium Alloy Casting for Robotic Wrist Joint', 'PRD-ARM-X6', 'Material Substitution', 'Elena Rostova', 'Approved & Released', AppStatusBadge(status: AppStatusType.approved)],
      ['ECO-2026-086', 'Low-Loss Power Inverter Circuit Revision', 'PRD-CONTROL-PNL', 'Electrical Revision', 'Alexander Wright', 'Prototyping', AppStatusBadge(status: AppStatusType.running)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'R&D & Engineering Change Orders (ECO)',
              subtitle: 'Product innovation lifecycle, CAD revision approvals, ECO change management, and prototype testing',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'R&D & ECOs'],
              actions: [
                AppButton(
                  label: 'Raise ECO Request',
                  icon: Icons.science_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter ECOs by number, product, or lead engineer...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['ECO Number', 'Change Title / Description', 'Target Assembly', 'Change Category', 'Lead R&D Engineer', 'Engineering Phase', 'Status'],
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
