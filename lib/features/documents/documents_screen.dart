import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['DOC-2026-9901', 'DMG Mori 5-Axis Milling CAD Drawing Package (Rev 4)', 'CAD / Engineering', '14.2 MB (PDF/STEP)', 'Arthur Pendelton', '2026-10-01', AppStatusBadge(status: AppStatusType.active)],
      ['DOC-2026-9902', 'ISO 9001:2026 Quality Audit Certificate', 'Compliance & Quality', '2.8 MB (PDF)', 'Sophia Chen', '2026-09-28', AppStatusBadge(status: AppStatusType.approved)],
      ['DOC-2026-9903', 'Apex Industrial Master Sales Contract Executed', 'Legal Contracts', '4.1 MB (PDF)', 'Elena Rostova', '2026-09-15', AppStatusBadge(status: AppStatusType.approved)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Document Management (S3 Encrypted Repository)',
              subtitle: 'Enterprise document versioning, presigned S3 downloads, retention policies, and access controls',
              breadcrumbs: const ['ERP', 'Administration & System', 'Documents'],
              actions: [
                AppButton(
                  label: 'Upload Document',
                  icon: Icons.cloud_upload_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Search documents by title, tag, or owner...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Document Ref', 'File Title & Description', 'Category', 'File Size / Format', 'Uploaded By', 'Upload Date', 'Status'],
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
