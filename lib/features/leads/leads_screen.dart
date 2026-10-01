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

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.leads.map((l) {
      return [
        l['id'],
        l['company'],
        l['leadName'],
        l['value'],
        l['stage'],
        l['probability'],
        l['assignedTo'],
        AppStatusBadge(status: l['status'] as AppStatusType),
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
              title: 'Sales Leads & Inbound Inquiries',
              subtitle: 'Lead scoring, conversion pipeline, and automated assignment',
              breadcrumbs: const ['ERP', 'CRM & Sales', 'Leads'],
              actions: [
                AppButton(
                  label: 'Capture Lead',
                  icon: Icons.person_add_alt_1_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter by lead name, company, or source...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Lead ID', 'Company', 'Contact', 'Est. Value', 'Stage', 'Prob.', 'Owner', 'Status'],
              rows: rows,
              flexWeights: const [1, 2, 2, 1, 2, 1, 2, 1],
              totalRecords: DemoDataStore.leads.length,
              onView: (idx) {},
              onEdit: (idx) {},
              onDelete: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
