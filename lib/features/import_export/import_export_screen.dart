import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ImportExportScreen extends StatelessWidget {
  const ImportExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['JOB-IMP-099', 'BULK_IMPORT', 'Customer Master List (XLSX)', '1,420 Records Processed', '0 Validation Errors', '2026-10-01 08:30', AppStatusBadge(status: AppStatusType.completed)],
      ['JOB-EXP-100', 'BULK_EXPORT', 'Monthly Stock Movement Audit (CSV)', '8,900 Rows Exported', 'Downloaded by Sophia Chen', '2026-10-01 11:15', AppStatusBadge(status: AppStatusType.completed)],
      ['JOB-IMP-101', 'BULK_IMPORT', 'BOM Engineering Component Tree (CSV)', '320 Components Updated', '0 Errors', '2026-09-30 14:00', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Data Import & Export Utilities',
              subtitle: 'Bulk CSV/XLSX processing, schema mapping, background async job execution, and data migration wizards',
              breadcrumbs: const ['ERP', 'Administration & System', 'Import & Export'],
              actions: [
                AppButton(
                  label: 'Launch Import Wizard',
                  icon: Icons.upload_file_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Export Master Data',
                  icon: Icons.file_download_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Job ID', 'Direction', 'Target Entity / File Scope', 'Execution Volume', 'Validation Report', 'Timestamp', 'Status'],
              rows: rows,
              flexWeights: const [2, 2, 3, 2, 2, 2, 1],
              totalRecords: rows.length,
              onView: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
