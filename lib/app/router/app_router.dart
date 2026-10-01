import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shell/app_shell.dart';
import '../../features/auth/login_screen.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/notifications/notifications_screen.dart';
import '../../features/search/search_screen.dart';
import '../../features/crm/crm_screen.dart';
import '../../features/customers/customers_screen.dart';
import '../../features/leads/leads_screen.dart';
import '../../features/quotations/quotations_screen.dart';
import '../../features/sales/sales_screen.dart';
import '../../features/finance/finance_screen.dart';
import '../../features/invoicing/invoicing_screen.dart';
import '../../features/procurement/procurement_screen.dart';
import '../../features/suppliers/suppliers_screen.dart';
import '../../features/purchase_orders/purchase_orders_screen.dart';
import '../../features/inventory/inventory_screen.dart';
import '../../features/warehouse/warehouse_screen.dart';
import '../../features/stock_movement/stock_movement_screen.dart';
import '../../features/products/products_screen.dart';
import '../../features/bom/bom_screen.dart';
import '../../features/supply_chain/supply_chain_screen.dart';
import '../../features/manufacturing/manufacturing_screen.dart';
import '../../features/production/production_screen.dart';
import '../../features/quality/quality_screen.dart';
import '../../features/maintenance/maintenance_screen.dart';
import '../../features/machines/machines_screen.dart';
import '../../features/iot/iot_screen.dart';
import '../../features/mqtt/mqtt_screen.dart';
import '../../features/plc/plc_screen.dart';
import '../../features/realtime/realtime_screen.dart';
import '../../features/alerts/alerts_screen.dart';
import '../../features/hr/hr_screen.dart';
import '../../features/attendance_leave/attendance_leave_screen.dart';
import '../../features/payroll/payroll_screen.dart';
import '../../features/projects/projects_screen.dart';
import '../../features/tasks/tasks_screen.dart';
import '../../features/rnd/rnd_screen.dart';
import '../../features/it/it_screen.dart';
import '../../features/legal/legal_screen.dart';
import '../../features/documents/documents_screen.dart';
import '../../features/reports/reports_screen.dart';
import '../../features/audit/audit_screen.dart';
import '../../features/system_health/system_health_screen.dart';
import '../../features/backup/backup_screen.dart';
import '../../features/import_export/import_export_screen.dart';
import '../../features/integrations/integrations_screen.dart';
import '../../features/organization/organization_screen.dart';
import '../../features/users/users_screen.dart';
import '../../features/roles/roles_screen.dart';
import '../../features/admin/admin_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/crm',
          builder: (context, state) => const CrmScreen(),
        ),
        GoRoute(
          path: '/customers',
          builder: (context, state) => const CustomersScreen(),
        ),
        GoRoute(
          path: '/leads',
          builder: (context, state) => const LeadsScreen(),
        ),
        GoRoute(
          path: '/quotations',
          builder: (context, state) => const QuotationsScreen(),
        ),
        GoRoute(
          path: '/sales',
          builder: (context, state) => const SalesScreen(),
        ),
        GoRoute(
          path: '/finance',
          builder: (context, state) => const FinanceScreen(),
        ),
        GoRoute(
          path: '/invoicing',
          builder: (context, state) => const InvoicingScreen(),
        ),
        GoRoute(
          path: '/procurement',
          builder: (context, state) => const ProcurementScreen(),
        ),
        GoRoute(
          path: '/suppliers',
          builder: (context, state) => const SuppliersScreen(),
        ),
        GoRoute(
          path: '/purchase-orders',
          builder: (context, state) => const PurchaseOrdersScreen(),
        ),
        GoRoute(
          path: '/inventory',
          builder: (context, state) => const InventoryScreen(),
        ),
        GoRoute(
          path: '/warehouse',
          builder: (context, state) => const WarehouseScreen(),
        ),
        GoRoute(
          path: '/stock-movement',
          builder: (context, state) => const StockMovementScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: '/bom',
          builder: (context, state) => const BomScreen(),
        ),
        GoRoute(
          path: '/supply-chain',
          builder: (context, state) => const SupplyChainScreen(),
        ),
        GoRoute(
          path: '/manufacturing',
          builder: (context, state) => const ManufacturingScreen(),
        ),
        GoRoute(
          path: '/production',
          builder: (context, state) => const ProductionScreen(),
        ),
        GoRoute(
          path: '/quality',
          builder: (context, state) => const QualityScreen(),
        ),
        GoRoute(
          path: '/maintenance',
          builder: (context, state) => const MaintenanceScreen(),
        ),
        GoRoute(
          path: '/machines',
          builder: (context, state) => const MachinesScreen(),
        ),
        GoRoute(
          path: '/iot',
          builder: (context, state) => const IotScreen(),
        ),
        GoRoute(
          path: '/mqtt',
          builder: (context, state) => const MqttScreen(),
        ),
        GoRoute(
          path: '/plc',
          builder: (context, state) => const PlcScreen(),
        ),
        GoRoute(
          path: '/realtime',
          builder: (context, state) => const RealtimeScreen(),
        ),
        GoRoute(
          path: '/alerts',
          builder: (context, state) => const AlertsScreen(),
        ),
        GoRoute(
          path: '/hr',
          builder: (context, state) => const HrScreen(),
        ),
        GoRoute(
          path: '/attendance-leave',
          builder: (context, state) => const AttendanceLeaveScreen(),
        ),
        GoRoute(
          path: '/payroll',
          builder: (context, state) => const PayrollScreen(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const ProjectsScreen(),
        ),
        GoRoute(
          path: '/tasks',
          builder: (context, state) => const TasksScreen(),
        ),
        GoRoute(
          path: '/rnd',
          builder: (context, state) => const RndScreen(),
        ),
        GoRoute(
          path: '/it',
          builder: (context, state) => const ItScreen(),
        ),
        GoRoute(
          path: '/legal',
          builder: (context, state) => const LegalScreen(),
        ),
        GoRoute(
          path: '/documents',
          builder: (context, state) => const DocumentsScreen(),
        ),
        GoRoute(
          path: '/reports',
          builder: (context, state) => const ReportsScreen(),
        ),
        GoRoute(
          path: '/audit',
          builder: (context, state) => const AuditScreen(),
        ),
        GoRoute(
          path: '/system-health',
          builder: (context, state) => const SystemHealthScreen(),
        ),
        GoRoute(
          path: '/backup',
          builder: (context, state) => const BackupScreen(),
        ),
        GoRoute(
          path: '/import-export',
          builder: (context, state) => const ImportExportScreen(),
        ),
        GoRoute(
          path: '/integrations',
          builder: (context, state) => const IntegrationsScreen(),
        ),
        GoRoute(
          path: '/organization',
          builder: (context, state) => const OrganizationScreen(),
        ),
        GoRoute(
          path: '/users',
          builder: (context, state) => const UsersScreen(),
        ),
        GoRoute(
          path: '/roles',
          builder: (context, state) => const RolesScreen(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => const AdminScreen(),
        ),
      ],
    ),
  ],
);
