import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_card.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

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
              title: 'Administration & Master System Settings',
              subtitle: 'Enterprise global configuration, feature toggles, security parameters, and license metadata',
              breadcrumbs: const ['ERP', 'Administration & System', 'Settings'],
              actions: [
                AppButton(
                  label: 'Save Configuration',
                  icon: Icons.save_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppCard(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Industrial MQTT Telemetry Auto-Ingestion'),
                    subtitle: const Text('Continuous 20Hz edge streaming into TimescaleDB and WebSocket pubsub'),
                    value: true,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text('Mandatory MFA / 2FA for Critical Machine Commands'),
                    subtitle: const Text('Requires hardware supervisor PIN before dispatching PLC setpoint overrides'),
                    value: true,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text('Automated Nightly S3 Cross-Region Disaster Recovery Backup'),
                    subtitle: const Text('Syncs encrypted PostgreSQL snapshots and object documents to secondary AWS region'),
                    value: true,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) {},
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text('Audit Log Cryptographic Verification'),
                    subtitle: const Text('Enables immutable HMAC hashing for every state-mutating transaction'),
                    value: true,
                    activeThumbColor: AppColors.primary,
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
