import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class SystemHealthScreen extends StatelessWidget {
  const SystemHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['PostgreSQL Authoritative DB Cluster', 'v16.3 Multi-AZ', '1.2 ms Ping (Healthy)', '24% CPU / 42% RAM', '0 Deadlocks', AppStatusBadge(status: AppStatusType.online)],
      ['Redis Session, Cache & BullMQ Cluster', 'v7.2.4 ElastiCache', '0.4 ms Ping (Healthy)', '18% Memory Used', '4 Active Queues (0 Lag)', AppStatusBadge(status: AppStatusType.online)],
      ['EMQX Industrial MQTT 5.0 Broker', 'v5.7.0 Cluster', '2,840 msgs/sec', '14% CPU (0 Packet Drop)', '142 Devices Connected', AppStatusBadge(status: AppStatusType.online)],
      ['NestJS REST & WebSocket API Gateway', 'Node 20 LTS (ECS)', '42 ms Avg Latency', '0.00% Error Rate', '4 Tasks Auto-Scaled', AppStatusBadge(status: AppStatusType.online)],
      ['AWS S3 Document Storage Service', 'Standard Encrypted', '100% Operational', '99.999999999% Durability', 'Presigned URL Active', AppStatusBadge(status: AppStatusType.online)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'System Health, Infrastructure & Microservices',
              subtitle: 'Real-time telemetry on database clusters, message queues, MQTT broker, and API latency',
              breadcrumbs: const ['ERP', 'Administration & System', 'System Health'],
              actions: [
                AppButton(
                  label: 'Execute Diagnostics',
                  icon: Icons.monitor_heart_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Infrastructure Component', 'Engine / Version', 'Latency / Connectivity', 'Resource Load', 'Queue / Performance Metric', 'Operational State'],
              rows: rows,
              flexWeights: const [3, 2, 2, 2, 3, 1],
              totalRecords: rows.length,
              onView: (idx) {},
            ),
          ],
        ),
      ),
    );
  }
}
