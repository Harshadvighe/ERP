import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class QualityScreen extends StatelessWidget {
  const QualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['QC-2026-401', 'Incoming Raw Material Inspection', 'SKU-SERVO-8800 (Lot #89)', 'CMM Dimension & Insulation Resistance', '0 Defects / 50 Sampled', 'Pass', AppStatusBadge(status: AppStatusType.approved)],
      ['QC-2026-402', 'In-Process Robotic Welding Inspection', 'PRD-ARM-X6 (Assembly Line 1)', 'Ultrasonic NDT Weld Seam', '1 Porosity Defect (Quarantined)', 'NCR Raised', AppStatusBadge(status: AppStatusType.fault)],
      ['QC-2026-403', 'Final Product Functional Run-Off', 'PRD-SPINDLE-B (Cell 3)', 'Vibration FFT Spectrum & Runout < 2µm', '100% Parameter Conformance', 'Pass & Certified', AppStatusBadge(status: AppStatusType.approved)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Quality Assurance (QA), QC & CAPA',
              subtitle: 'Inspection plans, non-conformance reports (NCR), defect tracking, and Corrective Actions (CAPA)',
              breadcrumbs: const ['ERP', 'Manufacturing & Quality', 'Quality Control'],
              actions: [
                AppButton(
                  label: 'Log Inspection Record',
                  icon: Icons.check_circle_outline,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Raise Non-Conformance (NCR)',
                  icon: Icons.report_problem_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter quality logs by report ID, item, or test protocol...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['QC Report #', 'Inspection Stage', 'Sampled Lot / Unit', 'Testing Protocol', 'Defect Analysis', 'Verdict', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 3, 3, 3, 2, 1],
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
