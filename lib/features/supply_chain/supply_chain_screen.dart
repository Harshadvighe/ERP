import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../shared/widgets/app_page_header.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_data_table.dart';
import '../../shared/widgets/app_filter_bar.dart';
import '../../shared/widgets/app_status_badge.dart';
import '../../shared/models/status_type.dart';

class SupplyChainScreen extends StatelessWidget {
  const SupplyChainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['SHP-2026-901', 'Kuehne + Nagel Logistics', 'SO-9021', 'Apex Industrial (Detroit, USA)', 'Ocean Freight', 'ETA: Oct 12, 2026', AppStatusBadge(status: AppStatusType.running)],
      ['SHP-2026-902', 'DHL Global Forwarding', 'SO-9022', 'Nordic Robotics (Stockholm, SE)', 'Air Cargo', 'Delivered (On-Time)', AppStatusBadge(status: AppStatusType.completed)],
      ['SHP-2026-903', 'DB Schenker Express', 'PO-7701', 'Plant 1 Receiving Dock', 'Road Freight', 'In Transit (Customs Cleared)', AppStatusBadge(status: AppStatusType.running)],
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: AppSpacing.pLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPageHeader(
              title: 'Supply Chain, Freight & Shipment Tracking',
              subtitle: 'Multi-modal carrier integrations, export compliance, delivery challans, and live tracking GPS',
              breadcrumbs: const ['ERP', 'Inventory & Supply Chain', 'Supply Chain'],
              actions: [
                AppButton(
                  label: 'Book Shipment',
                  icon: Icons.local_shipping_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            AppSpacing.gapLg,
            const AppFilterBar(searchHint: 'Track by shipment number, carrier, or order reference...'),
            AppSpacing.gapLg,
            AppDataTable(
              columns: const ['Shipment ID', 'Logistics Carrier', 'Order Ref', 'Destination / Hub', 'Mode', 'Estimated Transit', 'Status'],
              rows: rows,
              flexWeights: const [2, 2, 1, 3, 2, 2, 1],
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
