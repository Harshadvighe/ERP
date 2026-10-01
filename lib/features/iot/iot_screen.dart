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

class IotScreen extends StatelessWidget {
  const IotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = DemoDataStore.iotDevices.map((d) {
      return [
        d['deviceId'],
        d['name'],
        d['protocol'],
        d['ip'],
        d['battery'],
        d['signal'],
        d['lastPing'],
        AppStatusBadge(status: d['status'] as AppStatusType),
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
              title: 'IoT Sensor Devices & Hardware Nodes',
              subtitle: 'Edge sensor nodes, LoRaWAN environmental sensors, firmware OTA status, and battery telemetry',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'IoT Devices'],
              actions: [
                AppButton(
                  label: 'Provision New Sensor Node',
                  icon: Icons.add_circle_outline,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter devices by node ID, protocol or IP address...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Device Node ID', 'Device Label', 'Protocol / Transport', 'IP Address', 'Power / Battery', 'Signal RSSI', 'Last Ping', 'Status'],
              rows: rows,
              flexWeights: const [2, 3, 2, 2, 2, 2, 2, 1],
              totalRecords: DemoDataStore.iotDevices.length,
              onView: (idx) {},
              onEdit: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
