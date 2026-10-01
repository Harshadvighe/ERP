import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_chart_card.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class RealtimeScreen extends StatelessWidget {
  const RealtimeScreen({super.key});

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
              title: 'High-Frequency Realtime Telemetry Dashboard',
              subtitle: 'Sub-second streaming charts, machine vibration analysis, temperature sensors, and hydraulic loads',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'Realtime Telemetry'],
              actions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.tealLight,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.teal),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.teal, shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Text('STREAMING: 20 Hz', style: AppTextTheme.labelSmall.copyWith(color: AppColors.teal, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                AppSpacing.gapSm,
                AppButton(
                  label: 'Pause Stream',
                  icon: Icons.pause_circle_outline,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,

            // Realtime Charts Grid
            _buildRealtimeChartsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRealtimeChartsGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppChartCard(
                title: 'DMG Mori CNC - Spindle Vibration Peak-to-Peak (mm/s)',
                subtitle: 'Sensor Node: IOT-SENS-771 • Normal Threshold < 1.2 mm/s',
                trailing: const AppStatusBadge(status: AppStatusType.online, customLabel: 'HEALTHY: 0.84 mm/s'),
                chart: AppChartCard.buildSimpleLineChart(
                  values: [0.62, 0.74, 0.81, 0.79, 0.84, 0.88, 0.84],
                  labels: ['-30s', '-25s', '-20s', '-15s', '-10s', '-5s', 'Now'],
                  lineColor: AppColors.teal,
                ),
              ),
            ),
            AppSpacing.gapLg,
            Expanded(
              child: AppChartCard(
                title: 'Schuler Hydraulic Press - Line Pressure (Bar)',
                subtitle: 'Pressure Transducer DB100.DBD14 • Target 180 Bar',
                trailing: const AppStatusBadge(status: AppStatusType.online, customLabel: 'LIVE: 184.6 Bar'),
                chart: AppChartCard.buildSimpleLineChart(
                  values: [178.0, 181.2, 184.0, 185.2, 183.9, 184.6, 184.6],
                  labels: ['-30s', '-25s', '-20s', '-15s', '-10s', '-5s', 'Now'],
                  lineColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        AppSpacing.gapLg,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppChartCard(
                title: 'Main Bearing Temperature Profile (°C)',
                subtitle: 'PT100 RTD Sensor • Trip Limit 65.0 °C',
                trailing: const AppStatusBadge(status: AppStatusType.active, customLabel: 'TEMP: 42.8 °C'),
                chart: AppChartCard.buildSimpleLineChart(
                  values: [38.5, 39.2, 40.8, 41.5, 42.1, 42.8, 42.8],
                  labels: ['-30m', '-25m', '-20m', '-15m', '-10m', '-5m', 'Now'],
                  lineColor: AppColors.error,
                ),
              ),
            ),
            AppSpacing.gapLg,
            Expanded(
              child: AppChartCard(
                title: 'KUKA Robot Joint 1-6 Motor Currents (Amps)',
                subtitle: 'Synchronous Servo Bus Feedback',
                trailing: const AppStatusBadge(status: AppStatusType.running, customLabel: 'LOAD: 28.4 A'),
                chart: AppChartCard.buildSimpleBarChart(
                  values: [12.4, 28.4, 19.8, 14.2, 8.9, 6.1],
                  labels: ['Axis 1', 'Axis 2', 'Axis 3', 'Axis 4', 'Axis 5', 'Axis 6'],
                  barColor: AppColors.purple,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
