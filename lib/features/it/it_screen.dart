import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class ItScreen extends StatelessWidget {
  const ItScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['IT-AST-104', 'Industrial Edge Gateway Server (Advantech UNO)', 'Plant 1 IT Rack', '192.168.10.1', 'Ubuntu 24.04 LTS', '99.99% Uptime', AppStatusBadge(status: AppStatusType.online)],
      ['IT-AST-105', 'Cisco Catalyst 9300 Industrial Ethernet Switch', 'Plant 1 Main Telecom', '192.168.10.2', 'IOS-XE 17.9', '99.99% Uptime', AppStatusBadge(status: AppStatusType.online)],
      ['IT-AST-106', 'Engineering CAD Workstation Dell Precision 7920', 'R&D Lab Room 302', '10.0.4.52', 'Windows 11 Pro', 'Active', AppStatusBadge(status: AppStatusType.active)],
      ['IT-AST-107', 'Shop Floor Rugged Tablet (Panasonic Toughbook)', 'Assembly Line 01', '10.0.8.14', 'Android 14', 'Active', AppStatusBadge(status: AppStatusType.active)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'IT Infrastructure, Assets & Network Topology',
              subtitle: 'Shop floor industrial networking, edge compute servers, engineering workstations, and cybersecurity status',
              breadcrumbs: const ['ERP', 'People & Enterprise', 'IT Assets'],
              actions: [
                AppButton(
                  label: 'Add IT Asset',
                  icon: Icons.computer_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Network Scan',
                  icon: Icons.network_check_rounded,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter IT assets by hostname, IP address or facility...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Asset Tag #', 'Hardware Specification', 'Physical Location', 'Network IP', 'Operating System', 'Health Status', 'Status'],
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
