import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/demo/demo_data_store.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/models/status_type.dart';

class MachinesScreen extends StatelessWidget {
  const MachinesScreen({super.key});

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
              title: 'Machine Monitoring & SCADA Telemetry',
              subtitle: 'Live plant floor machine telemetry, Overall Equipment Effectiveness (OEE), and vibration sensors',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'Machines'],
              actions: [
                AppButton(
                  label: 'Plant Safety Interlock Override',
                  icon: Icons.lock_open_rounded,
                  variant: AppButtonVariant.danger,
                  onPressed: () => _showSafetyCommandDialog(context),
                ),
                AppButton(
                  label: 'Live Telemetry Gauges',
                  icon: Icons.speed,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter machinery by ID, plant bay, model or status...'),
            AppSpacing.gapLg,

            // Machine Cards Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 900;
                final width = isWide ? (constraints.maxWidth - AppSpacing.md) / 2 : constraints.maxWidth;

                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    for (final m in DemoDataStore.machines)
                      SizedBox(
                        width: width,
                        child: AppCard(
                          padding: AppSpacing.pLg,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: AppColors.primaryLight,
                                          borderRadius: AppRadius.rSm,
                                        ),
                                        child: const Icon(Icons.precision_manufacturing, color: AppColors.primaryDark, size: 24),
                                      ),
                                      AppSpacing.gapMd,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(m['name'] as String, style: AppTextTheme.headingSmall.copyWith(fontWeight: FontWeight.w700)),
                                          Text('${m['id']} • ${m['plant']}', style: AppTextTheme.bodySmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppStatusBadge(status: m['status'] as AppStatusType),
                                ],
                              ),
                              AppSpacing.gapMd,
                              const Divider(),
                              AppSpacing.gapMd,
                              Row(
                                children: [
                                  _buildMetricPill('OEE Index', m['oee'] as String, AppColors.teal),
                                  AppSpacing.gapSm,
                                  _buildMetricPill('Spindle Speed', m['spindleSpeed'] as String, AppColors.primary),
                                  AppSpacing.gapSm,
                                  _buildMetricPill('Bearing Temp', m['temperature'] as String, AppColors.error),
                                  AppSpacing.gapSm,
                                  _buildMetricPill('Vibration', m['vibration'] as String, AppColors.warning),
                                ],
                              ),
                              AppSpacing.gapMd,
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: AppRadius.rSm,
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Current Active Job: ${m['currentJob']}',
                                        style: AppTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    AppSpacing.gapSm,
                                    Text('Continuous Run: ${m['uptime']}', style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricPill(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: AppRadius.rSm,
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextTheme.labelSmall.copyWith(fontSize: 10, color: AppColors.textSecondary)),
            const SizedBox(height: 2),
            Text(value, style: AppTextTheme.labelMedium.copyWith(fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }

  void _showSafetyCommandDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.error),
            SizedBox(width: 8),
            Text('PLC Safety Command Gateway'),
          ],
        ),
        content: const SizedBox(
          width: 440,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CRITICAL SAFETY RULE: Software UI commands route through Backend Interlock Verification before reaching the Edge Gateway and Physical PLC.',
                style: TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Target Machine / Cell ID', hintText: 'MCH-CNC-01')),
              SizedBox(height: 12),
              TextField(decoration: InputDecoration(labelText: 'Command Type', hintText: 'SOFT_STOP / RE-CALIBRATE / CYCLE_START')),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(labelText: 'Supervisor Safety PIN', hintText: '••••'),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Dispatch Command via MQTT Bridge'),
          ),
        ],
      ),
    );
  }
}
