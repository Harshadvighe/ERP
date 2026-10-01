import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class MqttScreen extends StatelessWidget {
  const MqttScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['erp/org1/plant1/line1/machine/cnc01/telemetry', '1000 ms', 'QoS 1', '1,420 msgs/min', '2.4 MB/hr', AppStatusBadge(status: AppStatusType.online)],
      ['erp/org1/plant1/line1/machine/cnc01/status', 'On-Change', 'QoS 2', '12 msgs/min', '48 KB/hr', AppStatusBadge(status: AppStatusType.online)],
      ['erp/org1/plant1/line1/machine/cnc01/alerts', 'Event-Driven', 'QoS 2 (Retained)', '0 msgs/min', '0 KB/hr', AppStatusBadge(status: AppStatusType.online)],
      ['erp/org1/plant1/line2/machine/robot02/telemetry', '500 ms', 'QoS 1', '2,840 msgs/min', '5.1 MB/hr', AppStatusBadge(status: AppStatusType.online)],
      ['erp/org1/plant1/gateway/uno02/heartbeat', '5000 ms', 'QoS 0', '12 msgs/min', '12 KB/hr', AppStatusBadge(status: AppStatusType.online)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'MQTT Broker & Telemetry Gateway Management',
              subtitle: 'EMQX broker cluster status, topic hierarchies, QoS policies, throughput metrics, and payload schemas',
              breadcrumbs: const ['ERP', 'Industrial IoT & SCADA', 'MQTT Broker'],
              actions: [
                AppButton(
                  label: 'Subscribe Topic',
                  icon: Icons.add_link,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'Broker Diagnostics',
                  icon: Icons.cell_tower,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Filter active topics by path, plant or QoS...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['MQTT Topic Path Hierarchy', 'Publish Interval', 'QoS Level', 'Message Ingestion Rate', 'Bandwidth', 'Broker Status'],
              rows: rows,
              flexWeights: const [4, 2, 2, 2, 2, 1],
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
