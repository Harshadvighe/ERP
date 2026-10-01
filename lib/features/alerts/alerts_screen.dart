import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['ALT-8841', 'Spindle Bearing Over-Temperature Warning', 'MCH-CNC-01', 'HIGH', 'PT100 Temp > 50°C (Active 52.8°C)', '2026-10-01 13:12:04', AppStatusBadge(status: AppStatusType.pending, customLabel: 'UNACKNOWLEDGED')],
      ['ALT-8840', 'Safety Curtain Muted During Maintenance', 'MCH-PRESS-04', 'CRITICAL', 'Interlock Bypass Key Active', '2026-10-01 12:40:11', AppStatusBadge(status: AppStatusType.approved, customLabel: 'ACKNOWLEDGED')],
      ['ALT-8839', 'Cleanroom Ambient Humidity Below Spec', 'IOT-ENV-TEMP-09', 'LOW', 'Relative Humidity < 40% (Active 36%)', '2026-10-01 10:15:20', AppStatusBadge(status: AppStatusType.completed, customLabel: 'RESOLVED')],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Alarms, Safety Rules & Escalation Engine',
              subtitle: 'Active threshold violations, industrial safety interlocks, automated SMS/Email escalations, and incident acknowledgment',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'Alarms & Rules'],
              actions: [
                AppButton(
                  label: 'Define Alert Rule',
                  icon: Icons.rule_folder_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Acknowledge All',
                  icon: Icons.done_all,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter active alarms by severity, machine or rule ID...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Alarm ID', 'Alarm Title / Condition', 'Source Entity', 'Severity', 'Trigger Criterion', 'Trigger Timestamp', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 1, 3, 2, 2],
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
