import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class IntegrationsScreen extends StatelessWidget {
  const IntegrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['KEY-PROD-MES', 'Shop Floor Industrial Gateway API Key', 'Full Telemetry Ingestion Scope', '142,500 calls/day', 'Never Expires', AppStatusBadge(status: AppStatusType.active)],
      ['WHK-SALES-DISPATCH', 'Realtime Webhook: Order Dispatched to 3PL Carrier', 'https://api.kuehne-nagel.com/v2/events', 'POST (HMAC Signed)', '0 Retries (100% OK)', AppStatusBadge(status: AppStatusType.active)],
      ['KEY-DEV-SANDBOX', 'External CRM Integration Key (Salesforce Sync)', 'Read-Only Customers & Orders', '1,200 calls/day', 'Expires: 2027-01-01', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'API Management, Keys & Outbound Webhooks',
              subtitle: 'Third-party system connectors, secure token generation, IP whitelisting, and webhook event streaming',
              breadcrumbs: const ['ERP', 'Administration & System', 'API Management'],
              actions: [
                AppButton(
                  label: 'Generate API Key',
                  icon: Icons.key_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Create Webhook',
                  icon: Icons.webhook_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Identifier / Name', 'Description / Target URL', 'Permissions Scope', 'Traffic Volume', 'Expiration', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 3, 2, 2, 1],
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
