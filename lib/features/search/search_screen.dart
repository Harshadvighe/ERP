import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController(text: 'Apex Industrial');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Omni-Search ERP Global Index',
              subtitle: 'Universal fulltext search across customers, sales orders, purchase orders, inventory SKUs, telemetry tags, and contracts',
              breadcrumbs: const ['ERP', 'Platform Overview', 'Global Search'],
            ),
            AppSpacing.gapLg,
            AppSearchField(
              controller: _searchController,
              hint: 'Search by any keyword, customer, SKU, order ID or telemetry tag...',
              onChanged: (val) => setState(() {}),
            ),
            AppSpacing.gapLg,

            // Search Results Categories
            Text('SEARCH RESULTS FOR "${_searchController.text}" (4 Matches Found)',
                style: AppTextTheme.labelSmall.copyWith(color: AppColors.textSecondary, letterSpacing: 0.5)),
            AppSpacing.gapMd,

            AppCard(
              child: Column(
                children: [
                  _buildResultTile(
                    category: 'CUSTOMER ACCOUNT',
                    title: 'Apex Industrial Automation Ltd (CUST-1001)',
                    subtitle: 'Industry: Automotive & Heavy Fab • Primary Contact: Marcus Vance',
                    icon: Icons.people_alt_outlined,
                    status: AppStatusType.active,
                  ),
                  const Divider(height: 1),
                  _buildResultTile(
                    category: 'COMMERCIAL QUOTATION',
                    title: 'Quotation QT-2026-0041 (\$184,200.00)',
                    subtitle: 'Customer: Apex Industrial Automation • 8 Line Items • Approved',
                    icon: Icons.request_quote_outlined,
                    status: AppStatusType.approved,
                  ),
                  const Divider(height: 1),
                  _buildResultTile(
                    category: 'SALES ORDER',
                    title: 'Sales Order SO-9021 (80% Dispatched)',
                    subtitle: 'Customer: Apex Industrial Automation • Total: \$184,200.00',
                    icon: Icons.point_of_sale_outlined,
                    status: AppStatusType.running,
                  ),
                  const Divider(height: 1),
                  _buildResultTile(
                    category: 'LEGAL CONTRACT',
                    title: 'Contract CTR-2026-041 (Master Supply Agreement)',
                    subtitle: 'Term: 2026-01-01 to 2028-12-31 • Executed & Sealed in Vault',
                    icon: Icons.gavel_outlined,
                    status: AppStatusType.approved,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultTile({
    required String category,
    required String title,
    required String subtitle,
    required IconData icon,
    required AppStatusType status,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: AppRadius.rSm,
        ),
        child: Icon(icon, color: AppColors.primary, size: 20),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: AppTextTheme.labelSmall.copyWith(color: AppColors.primaryDark, fontSize: 10)),
          const SizedBox(height: 2),
          Text(title, style: AppTextTheme.labelLarge),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(subtitle, style: AppTextTheme.bodySmall),
      ),
      trailing: AppStatusBadge(status: status),
      onTap: () {},
    );
  }
}
