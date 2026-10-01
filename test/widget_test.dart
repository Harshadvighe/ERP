import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:company_erp/app/app.dart';
import 'package:company_erp/features/auth/login_screen.dart';
import 'package:company_erp/features/customers/customers_screen.dart';
import 'package:company_erp/features/inventory/inventory_screen.dart';
import 'package:company_erp/features/machines/machines_screen.dart';
import 'package:company_erp/shared/widgets/app_status_badge.dart';
import 'package:company_erp/shared/widgets/app_kpi_card.dart';
import 'package:company_erp/shared/widgets/app_button.dart';
import 'package:company_erp/shared/widgets/app_data_table.dart';
import 'package:company_erp/shared/models/status_type.dart';

void main() {
  group('Company ERP Master Test Suite', () {
    testWidgets('App initializes and renders Dashboard with KPIs', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ProviderScope(
          child: CompanyErpApp(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify Brand & Header
      expect(find.text('COMPANY ERP'), findsWidgets);
      expect(find.text('Executive & Operations Dashboard'), findsOneWidget);

      // Verify KPI Metrics
      expect(find.text('Total Revenue (MTD)'), findsOneWidget);
      expect(find.text('Active Sales Orders'), findsOneWidget);
      expect(find.text('Plant Output Rate'), findsOneWidget);
      expect(find.text('OEE Operational Index'), findsOneWidget);
    });

    testWidgets('LoginScreen renders enterprise inputs and quick launch button', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('COMPANY ERP'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign In to ERP Portal'), findsOneWidget);
      expect(find.text('Quick Launch as Plant Operator'), findsOneWidget);
    });

    testWidgets('CustomersScreen renders customer master table with actions', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CustomersScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Customer Master Directory'), findsOneWidget);
      expect(find.text('Apex Industrial Automation Ltd'), findsOneWidget);
      expect(find.text('Titan Dynamics Corp'), findsOneWidget);
    });

    testWidgets('InventoryScreen renders SKU stock records and reorder levels', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: InventoryScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Inventory Stock & Reorder Levels'), findsOneWidget);
      expect(find.text('SKU-SERVO-8800'), findsOneWidget);
      expect(find.text('High-Torque AC Servo Motor 7.5kW'), findsOneWidget);
    });

    testWidgets('MachinesScreen renders live SCADA cards and safety interlock override trigger', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: MachinesScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Machine Monitoring & SCADA Telemetry'), findsOneWidget);
      expect(find.text('Plant Safety Interlock Override'), findsOneWidget);
      expect(find.text('5-Axis DMG Mori CNC Milling Center'), findsOneWidget);
    });

    testWidgets('Status Badge renders correct semantic label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppStatusBadge(status: AppStatusType.online),
          ),
        ),
      );

      expect(find.text('ONLINE'), findsOneWidget);
    });

    testWidgets('AppButton triggers onPressed callback', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Dispatch Command',
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Dispatch Command'));
      expect(tapped, isTrue);
    });

    testWidgets('AppKpiCard displays metric values and change badge', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppKpiCard(
              title: 'Telemetry Stream Rate',
              value: '1,420 msgs/sec',
              changePercentage: '+5.4%',
              icon: Icons.speed,
            ),
          ),
        ),
      );

      expect(find.text('Telemetry Stream Rate'), findsOneWidget);
      expect(find.text('1,420 msgs/sec'), findsOneWidget);
      expect(find.text('+5.4%'), findsOneWidget);
    });

    testWidgets('AppDataTable renders columns and rows correctly in responsive mobile mode', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDataTable(
              columns: const ['SKU', 'Title', 'Qty'],
              rows: const [
                ['SKU-1', 'Part A', '10 pcs'],
                ['SKU-2', 'Part B', '25 pcs'],
              ],
              totalRecords: 2,
            ),
          ),
        ),
      );

      expect(find.text('SKU'), findsWidgets);
      expect(find.text('Part A'), findsOneWidget);
      expect(find.text('Part B'), findsOneWidget);
    });
  });
}
