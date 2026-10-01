import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/demo/demo_data_store.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/models/status_type.dart';

class CrmScreen extends StatelessWidget {
  const CrmScreen({super.key});

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
              title: 'CRM Pipeline & Opportunities',
              subtitle: 'Lead conversion funnels, interaction history, and enterprise customer relations',
              breadcrumbs: const ['ERP', 'CRM & Sales', 'Pipeline'],
              actions: [
                AppButton(
                  label: 'Add Opportunity',
                  icon: Icons.add,
                  onPressed: () => _showAddOpportunityDialog(context),
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter opportunities by customer, value or rep...'),
            AppSpacing.gapLg,

            // Pipeline Stages Board
            _buildPipelineStages(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPipelineStages(BuildContext context) {
    final stages = [
      {'title': '1. Discovery & Lead Qualification', 'count': 6, 'value': '\$630,000', 'color': AppColors.info},
      {'title': '2. Technical Evaluation & RFQ', 'count': 4, 'value': '\$1,250,000', 'color': AppColors.warning},
      {'title': '3. Formal Proposal & Quote', 'count': 5, 'value': '\$980,000', 'color': AppColors.primary},
      {'title': '4. Negotiation & Approval', 'count': 3, 'value': '\$1,420,000', 'color': AppColors.purple},
      {'title': '5. Won / Sales Order', 'count': 8, 'value': '\$2,850,000', 'color': AppColors.success},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final stage in stages) ...[
            Container(
              width: 280,
              margin: const EdgeInsets.only(right: AppSpacing.md),
              padding: AppSpacing.pMd,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.rMd,
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          stage['title'] as String,
                          style: AppTextTheme.labelMedium.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: (stage['color'] as Color).withValues(alpha: 0.12),
                          borderRadius: AppRadius.rRound,
                        ),
                        child: Text(
                          '${stage['count']}',
                          style: AppTextTheme.labelSmall.copyWith(color: stage['color'] as Color),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.gapXs,
                  Text(
                    'Stage Total: ${stage['value']}',
                    style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const Divider(height: 20),
                  for (final lead in DemoDataStore.leads) ...[
                    AppCard(
                      padding: AppSpacing.pSm,
                      color: AppColors.background,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lead['company'] as String, style: AppTextTheme.labelLarge),
                          AppSpacing.gapXxs,
                          Text('Contact: ${lead['leadName']} • ${lead['value']}',
                              style: AppTextTheme.bodySmall.copyWith(color: AppColors.textPrimary)),
                          AppSpacing.gapSm,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rep: ${lead['assignedTo']}',
                                  style: AppTextTheme.bodySmall.copyWith(color: AppColors.textMuted)),
                              AppStatusBadge(status: lead['status'] as AppStatusType),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.gapSm,
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddOpportunityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Opportunity'),
        content: const SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Customer / Prospect Name')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Estimated Deal Value (\$)')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Primary Contact Person')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Create Opportunity')),
        ],
      ),
    );
  }
}
