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

class AuditScreen extends StatelessWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.auditLogs.map((a) {
      return [
        a['id'],
        a['action'],
        a['actor'],
        a['entity'],
        a['ip'],
        a['timestamp'],
        AppStatusBadge(status: a['status'] as AppStatusType),
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
              title: 'Immutable Enterprise Audit Trails',
              subtitle: 'Cryptographically timestamped record of user mutations, security overrides, and financial transactions',
              breadcrumbs: const ['ERP', 'Administration & System', 'Audit Logs'],
              actions: [
                AppButton(
                  label: 'Export Compliance Log',
                  icon: Icons.download_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter audit logs by actor, entity or action type...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Audit Ref #', 'Operation / Action Event', 'Actor User (Account)', 'Affected Resource Entity', 'Origin IP', 'UTC Timestamp', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 3, 3, 2, 3, 1],
              totalRecords: DemoDataStore.auditLogs.length,
              onView: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
