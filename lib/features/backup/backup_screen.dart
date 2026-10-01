import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['BKP-2026-10-01-001', 'Automated Daily Full PostgreSQL & Document Backup', '142.8 GB', 'AWS S3 Glacier Instant', '2026-10-01 02:00 UTC', 'Checksum Verified (SHA-256)', AppStatusBadge(status: AppStatusType.completed)],
      ['BKP-2026-09-30-001', 'Automated Daily Full PostgreSQL & Document Backup', '141.2 GB', 'AWS S3 Glacier Instant', '2026-09-30 02:00 UTC', 'Checksum Verified (SHA-256)', AppStatusBadge(status: AppStatusType.completed)],
      ['BKP-2026-09-29-001', 'Automated Daily Full PostgreSQL & Document Backup', '139.8 GB', 'AWS S3 Glacier Instant', '2026-09-29 02:00 UTC', 'Checksum Verified (SHA-256)', AppStatusBadge(status: AppStatusType.completed)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Backup Snapshots & Disaster Recovery',
              subtitle: 'Automated point-in-time recovery (PITR), cross-region replication, and automated restore verification drills',
              breadcrumbs: const ['ERP', 'Administration & System', 'Backup & Recovery'],
              actions: [
                AppButton(
                  label: 'Trigger On-Demand Backup',
                  icon: Icons.backup_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Disaster Recovery Drill',
                  icon: Icons.restore_page_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Snapshot ID', 'Backup Description / Type', 'Archive Size', 'Storage Vault Target', 'UTC Timestamp', 'Integrity Status', 'Status'],
              rows: rows,
              flexWeights: const [2, 4, 1, 2, 2, 2, 1],
              totalRecords: rows.length,
              onView: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
