import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class AttendanceLeaveScreen extends StatelessWidget {
  const AttendanceLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['Alexander Wright', 'Engineering', 'Shift A (08:00 - 16:30)', '07:54 AM', 'In Office', '0 Late Mins', AppStatusBadge(status: AppStatusType.active, customLabel: 'PRESENT')],
      ['Elena Rostova', 'Sales & CRM', 'General (09:00 - 17:30)', '08:48 AM', 'Customer Site', '0 Late Mins', AppStatusBadge(status: AppStatusType.active, customLabel: 'ON DUTY')],
      ['Marcus Brody', 'Manufacturing', 'Shift A (08:00 - 16:30)', '07:45 AM', 'Plant Floor', '0 Late Mins', AppStatusBadge(status: AppStatusType.active, customLabel: 'PRESENT')],
      ['Arthur Pendelton', 'Maintenance', 'Shift A (08:00 - 16:30)', '-', 'Annual Leave', '-', AppStatusBadge(status: AppStatusType.pending, customLabel: 'ON LEAVE')],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Attendance, Biometric Sync & Leave Management',
              subtitle: 'Shift rosters, biometric gate reader sync, overtime calculations, and leave approval workflows',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'Attendance & Leave'],
              actions: [
                AppButton(
                  label: 'Apply for Leave',
                  icon: Icons.event_note,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Biometric Gate Sync',
                  icon: Icons.fingerprint,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter attendance records by employee or shift...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Employee Name', 'Department', 'Assigned Shift', 'Punch-In Time', 'Location', 'Exceptions', 'Status'],
              rows: rows,
              flexWeights: const [3, 2, 3, 2, 2, 2, 2],
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
