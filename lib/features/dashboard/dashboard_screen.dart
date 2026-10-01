import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/demo/demo_data_store.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_kpi_card.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_chart_card.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with Plant Status and Quick Actions
            AppPageHeader(
              title: 'Executive & Operations Dashboard',
              subtitle: 'Real-time overview of Plant Alpha-1 & Enterprise ERP metrics',
              breadcrumbs: const ['ERP', 'Overview', 'Dashboard'],
              actions: [
                AppButton(
                  label: 'New Sales Order',
                  icon: Icons.add_shopping_cart,
                  onPressed: () => context.go('/sales'),
                ),
                AppButton(
                  label: 'PLC Live Tags',
                  icon: Icons.developer_board,
                  variant: AppButtonVariant.secondary,
                  onPressed: () => context.go('/plc'),
                ),
                AppButton(
                  label: 'Generate Report',
                  icon: Icons.download_outlined,
                  variant: AppButtonVariant.secondary,
                  onPressed: () => context.go('/reports'),
                ),
              ],
            ),
            AppSpacing.gapLg,

            // KPI Metrics Grid
            _buildKpiGrid(context),
            AppSpacing.gapLg,

            // Charts Section (Sales Overview & Production Output)
            _buildChartsSection(context),
            AppSpacing.gapLg,

            // Live Machine Telemetry Summary & Recent Activities
            _buildOperationalSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiGrid(BuildContext context) {
    final kpis = DemoDataStore.dashboardKpis;
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = isDesktop ? 6 : (isTablet ? 3 : 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - (crossAxisCount - 1) * AppSpacing.md) / crossAxisCount;

        return Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['revenue']['label'],
                value: kpis['revenue']['value'],
                changePercentage: kpis['revenue']['change'],
                isPositive: kpis['revenue']['isPositive'],
                icon: Icons.attach_money_rounded,
                iconColor: AppColors.success,
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['orders']['label'],
                value: kpis['orders']['value'],
                changePercentage: kpis['orders']['change'],
                isPositive: kpis['orders']['isPositive'],
                icon: Icons.shopping_bag_outlined,
                iconColor: AppColors.primary,
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['production']['label'],
                value: kpis['production']['value'],
                changePercentage: kpis['production']['change'],
                isPositive: kpis['production']['isPositive'],
                icon: Icons.precision_manufacturing_outlined,
                iconColor: AppColors.info,
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['inventory']['label'],
                value: kpis['inventory']['value'],
                changePercentage: kpis['inventory']['change'],
                isPositive: kpis['inventory']['isPositive'],
                icon: Icons.inventory_2_outlined,
                iconColor: AppColors.warning,
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['machines']['label'],
                value: kpis['machines']['value'],
                changePercentage: kpis['machines']['change'],
                isPositive: kpis['machines']['isPositive'],
                icon: Icons.sensors_outlined,
                iconColor: AppColors.teal,
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: AppKpiCard(
                title: kpis['employees']['label'],
                value: kpis['employees']['value'],
                changePercentage: kpis['employees']['change'],
                isPositive: kpis['employees']['isPositive'],
                icon: Icons.badge_outlined,
                iconColor: AppColors.purple,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChartsSection(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final salesChart = AppChartCard(
      title: 'Revenue & Sales Trajectory',
      subtitle: 'Trailing 6 Months Invoiced (\$ in Thousands)',
      trailing: const AppStatusBadge(status: AppStatusType.active, customLabel: 'TARGET: +12%'),
      chart: AppChartCard.buildSimpleLineChart(
        values: [180, 240, 310, 290, 410, 480],
        labels: ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
        lineColor: AppColors.primary,
      ),
    );

    final productionChart = AppChartCard(
      title: 'Plant Production Output vs Plan',
      subtitle: 'Daily Machined & Assembled Units (Thousands)',
      trailing: const AppStatusBadge(status: AppStatusType.running, customLabel: 'LINE 1-4 ACTIVE'),
      chart: AppChartCard.buildSimpleBarChart(
        values: [42, 58, 64, 78, 85, 92, 88],
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        barColor: AppColors.teal,
      ),
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: salesChart),
          AppSpacing.gapLg,
          Expanded(child: productionChart),
        ],
      );
    }

    return Column(
      children: [
        salesChart,
        AppSpacing.gapMd,
        productionChart,
      ],
    );
  }

  Widget _buildOperationalSummary(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final machineStatusWidget = AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Live Machine & PLC Telemetry',
                  style: AppTextTheme.headingSmall.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppButton(
                label: 'SCADA Panel',
                variant: AppButtonVariant.text,
                onPressed: () => context.go('/machines'),
              ),
            ],
          ),
          AppSpacing.gapMd,
          for (final m in DemoDataStore.machines) ...[
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: AppRadius.rSm,
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: AppRadius.rSm,
                    ),
                    child: const Icon(Icons.precision_manufacturing, size: 20, color: AppColors.primary),
                  ),
                  AppSpacing.gapMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m['name'] as String, style: AppTextTheme.labelLarge, overflow: TextOverflow.ellipsis),
                        Text('OEE: ${m['oee']} • Spindle: ${m['spindleSpeed']} • Temp: ${m['temperature']}',
                            style: AppTextTheme.bodySmall, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  AppStatusBadge(status: m['status'] as AppStatusType),
                ],
              ),
            ),
          ],
        ],
      ),
    );

    final recentAuditWidget = AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Recent Enterprise Audit Events',
                  style: AppTextTheme.headingSmall.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppButton(
                label: 'View All Logs',
                variant: AppButtonVariant.text,
                onPressed: () => context.go('/audit'),
              ),
            ],
          ),
          AppSpacing.gapMd,
          for (final a in DemoDataStore.auditLogs) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                radius: 16,
                child: Icon(Icons.security, size: 16, color: AppColors.primaryDark),
              ),
              title: Text(a['action'] as String, style: AppTextTheme.labelMedium),
              subtitle: Text('${a['actor']} • ${a['timestamp']}', style: AppTextTheme.bodySmall),
              trailing: AppStatusBadge(status: a['status'] as AppStatusType),
            ),
            const Divider(height: 1),
          ],
        ],
      ),
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: machineStatusWidget),
          AppSpacing.gapLg,
          Expanded(flex: 2, child: recentAuditWidget),
        ],
      );
    }

    return Column(
      children: [
        machineStatusWidget,
        AppSpacing.gapMd,
        recentAuditWidget,
      ],
    );
  }
}
