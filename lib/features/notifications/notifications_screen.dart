import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
              title: 'Notification Center & Alert Feeds',
              subtitle: 'Operational alerts, workflow approvals, dispatch milestones, and security warnings',
              breadcrumbs: const ['ERP', 'Platform Overview', 'Notifications'],
              actions: [
                AppButton(
                  label: 'Mark All Read',
                  icon: Icons.done_all,
                  variant: AppButtonVariant.secondary,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            AppCard(
              child: Column(
                children: [
                  AppNotificationTile(
                    title: 'Machine Bearing Temperature Alert (MCH-CNC-01)',
                    message: 'Spindle bearing operating at 52.8°C exceeding normal limit of 50°C. Predictive lubrication recommended.',
                    time: '12 minutes ago',
                    isUnread: true,
                    icon: Icons.warning_amber_rounded,
                    iconColor: AppColors.error,
                  ),
                  const Divider(height: 1),
                  AppNotificationTile(
                    title: 'Commercial Quotation Approved: QT-2026-0041',
                    message: 'Quotation for Apex Industrial Automation (\$184,200) was signed by Sales VP and converted to SO-9021.',
                    time: '45 minutes ago',
                    isUnread: true,
                    icon: Icons.verified_outlined,
                    iconColor: AppColors.success,
                  ),
                  const Divider(height: 1),
                  AppNotificationTile(
                    title: 'Goods Receipt Note Generated: PO-7702',
                    message: 'Sandvik Coromant cutting tool batch (100% complete) was inspected and moved to WH-Plant 1 A.',
                    time: '2 hours ago',
                    isUnread: false,
                    icon: Icons.inventory_2_outlined,
                    iconColor: AppColors.primary,
                  ),
                  const Divider(height: 1),
                  AppNotificationTile(
                    title: 'Monthly Ledger Period Close Executed',
                    message: 'September 2026 accounting period successfully reconciled and locked by Head of Corporate Finance.',
                    time: '5 hours ago',
                    isUnread: false,
                    icon: Icons.account_balance_outlined,
                    iconColor: AppColors.info,
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
