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

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.customers.map((c) {
      return [
        c['id'],
        c['name'],
        c['contactPerson'],
        c['industry'],
        c['creditLimit'],
        c['balance'],
        AppStatusBadge(status: c['status'] as AppStatusType),
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
              title: 'Customer Master Directory',
              subtitle: 'Corporate accounts, credit limits, contacts, and order histories',
              breadcrumbs: const ['ERP', 'CRM & Sales', 'Customers'],
              actions: [
                AppButton(
                  label: 'Add Customer',
                  icon: Icons.add_business_outlined,
                  onPressed: () => _showAddCustomerDialog(context),
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppFilterBar(
              searchHint: 'Search by account name, code or contact...',
              onAddPressed: () => _showAddCustomerDialog(context),
              addLabel: 'New Account',
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Code', 'Company Name', 'Primary Contact', 'Industry', 'Credit Limit', 'Balance Due', 'Status'],
              rows: rows,
              flexWeights: const [1, 2, 2, 2, 1, 1, 1],
              totalRecords: DemoDataStore.customers.length,
              onView: (idx) {},
              onEdit: (idx) {},
              onDelete: (idx) {},
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCustomerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Enterprise Customer'),
        content: const SizedBox(
          width: 440,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Company Full Legal Name')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Primary Contact Person')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Email Address')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Approved Credit Limit (\$)')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Save Customer')),
        ],
      ),
    );
  }
}
