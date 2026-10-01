import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../features/auth/auth_provider.dart';

class NavGroup {
  final String title;
  final List<NavEntry> entries;
  const NavGroup({required this.title, required this.entries});
}

class NavEntry {
  final String title;
  final String route;
  final IconData icon;
  final int? badgeCount;
  const NavEntry({required this.title, required this.route, required this.icon, this.badgeCount});
}

class AppShell extends ConsumerStatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  bool _isSidebarCollapsed = false;

  static const List<NavGroup> navGroups = [
    NavGroup(
      title: 'PLATFORM OVERVIEW',
      entries: [
        NavEntry(title: 'Dashboard', route: '/dashboard', icon: Icons.dashboard_outlined),
        NavEntry(title: 'Notifications', route: '/notifications', icon: Icons.notifications_outlined, badgeCount: 3),
        NavEntry(title: 'Global Search', route: '/search', icon: Icons.search_outlined),
      ],
    ),
    NavGroup(
      title: 'CRM & SALES',
      entries: [
        NavEntry(title: 'CRM Pipeline', route: '/crm', icon: Icons.view_kanban_outlined),
        NavEntry(title: 'Customers', route: '/customers', icon: Icons.people_alt_outlined),
        NavEntry(title: 'Leads', route: '/leads', icon: Icons.contact_page_outlined),
        NavEntry(title: 'Quotations', route: '/quotations', icon: Icons.request_quote_outlined),
        NavEntry(title: 'Sales Orders', route: '/sales', icon: Icons.point_of_sale_outlined),
      ],
    ),
    NavGroup(
      title: 'FINANCE & PROCUREMENT',
      entries: [
        NavEntry(title: 'Finance & Ledger', route: '/finance', icon: Icons.account_balance_outlined),
        NavEntry(title: 'Invoicing & Pay', route: '/invoicing', icon: Icons.receipt_long_outlined),
        NavEntry(title: 'Procurement', route: '/procurement', icon: Icons.shopping_cart_checkout_outlined),
        NavEntry(title: 'Suppliers', route: '/suppliers', icon: Icons.storefront_outlined),
        NavEntry(title: 'Purchase Orders', route: '/purchase-orders', icon: Icons.shopping_bag_outlined),
      ],
    ),
    NavGroup(
      title: 'INVENTORY & SUPPLY CHAIN',
      entries: [
        NavEntry(title: 'Inventory Stock', route: '/inventory', icon: Icons.inventory_2_outlined),
        NavEntry(title: 'Warehouse & Zones', route: '/warehouse', icon: Icons.warehouse_outlined),
        NavEntry(title: 'Stock Movements', route: '/stock-movement', icon: Icons.swap_horiz_outlined),
        NavEntry(title: 'Products & SKUs', route: '/products', icon: Icons.category_outlined),
        NavEntry(title: 'Bill of Materials', route: '/bom', icon: Icons.account_tree_outlined),
        NavEntry(title: 'Supply Chain Track', route: '/supply-chain', icon: Icons.local_shipping_outlined),
      ],
    ),
    NavGroup(
      title: 'MANUFACTURING & QUALITY',
      entries: [
        NavEntry(title: 'Manufacturing MES', route: '/manufacturing', icon: Icons.precision_manufacturing_outlined),
        NavEntry(title: 'Production Orders', route: '/production', icon: Icons.assignment_outlined),
        NavEntry(title: 'Quality & CAPA', route: '/quality', icon: Icons.verified_outlined),
        NavEntry(title: 'Maintenance (TPM)', route: '/maintenance', icon: Icons.build_outlined),
      ],
    ),
    NavGroup(
      title: 'INDUSTRIAL IOT & SCADA',
      entries: [
        NavEntry(title: 'Machine Monitoring', route: '/machines', icon: Icons.sensors_outlined),
        NavEntry(title: 'IoT Devices', route: '/iot', icon: Icons.router_outlined),
        NavEntry(title: 'MQTT Engine', route: '/mqtt', icon: Icons.cell_tower_outlined),
        NavEntry(title: 'PLC / SCADA Control', route: '/plc', icon: Icons.developer_board_outlined),
        NavEntry(title: 'Realtime Telemetry', route: '/realtime', icon: Icons.query_stats_outlined),
        NavEntry(title: 'Alarms & Safety', route: '/alerts', icon: Icons.crisis_alert_outlined),
      ],
    ),
    NavGroup(
      title: 'PEOPLE & ENTERPRISE',
      entries: [
        NavEntry(title: 'HR & Personnel', route: '/hr', icon: Icons.badge_outlined),
        NavEntry(title: 'Attendance & Leave', route: '/attendance-leave', icon: Icons.event_available_outlined),
        NavEntry(title: 'Payroll Management', route: '/payroll', icon: Icons.payments_outlined),
        NavEntry(title: 'Projects & Tasks', route: '/projects', icon: Icons.task_alt_outlined),
        NavEntry(title: 'R&D / ECOs', route: '/rnd', icon: Icons.science_outlined),
        NavEntry(title: 'Legal & Compliance', route: '/legal', icon: Icons.gavel_outlined),
      ],
    ),
    NavGroup(
      title: 'ADMINISTRATION & SYSTEM',
      entries: [
        NavEntry(title: 'Document Center', route: '/documents', icon: Icons.folder_shared_outlined),
        NavEntry(title: 'Reports Engine', route: '/reports', icon: Icons.assessment_outlined),
        NavEntry(title: 'Audit Logs', route: '/audit', icon: Icons.history_outlined),
        NavEntry(title: 'System Health', route: '/system-health', icon: Icons.monitor_heart_outlined),
        NavEntry(title: 'Backup & Recovery', route: '/backup', icon: Icons.backup_outlined),
        NavEntry(title: 'Import & Export', route: '/import-export', icon: Icons.import_export_outlined),
        NavEntry(title: 'Integrations & APIs', route: '/integrations', icon: Icons.api_outlined),
        NavEntry(title: 'Organization Master', route: '/organization', icon: Icons.corporate_fare_outlined),
        NavEntry(title: 'Users Directory', route: '/users', icon: Icons.manage_accounts_outlined),
        NavEntry(title: 'Roles & RBAC', route: '/roles', icon: Icons.security_outlined),
        NavEntry(title: 'System Settings', route: '/admin', icon: Icons.settings_outlined),
      ],
    ),
  ];

  int _getBottomNavIndex(String location) {
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/sales') || location.startsWith('/crm')) return 1;
    if (location.startsWith('/inventory')) return 2;
    if (location.startsWith('/machines') || location.startsWith('/realtime')) return 3;
    return 4;
  }

  void _onBottomNavTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/sales');
        break;
      case 2:
        context.go('/inventory');
        break;
      case 3:
        context.go('/machines');
        break;
      case 4:
        Scaffold.of(context).openDrawer();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final authState = ref.watch(authProvider);

    if (isDesktop) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          children: [
            // Collapsible Left Desktop Sidebar
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isSidebarCollapsed ? 76 : 280,
              decoration: const BoxDecoration(
                color: AppColors.sidebarBackground,
                border: Border(right: BorderSide(color: AppColors.border, width: 1)),
              ),
              child: _buildSidebar(location),
            ),

            // Main Content Area
            Expanded(
              child: Column(
                children: [
                  _buildTopBar(context, authState),
                  Expanded(
                    child: SelectionArea(
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Mobile / Tablet Responsive Layout
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.precision_manufacturing_rounded, color: Colors.white, size: 16),
            ),
            AppSpacing.gapSm,
            Text(
              'COMPANY ERP',
              style: AppTextTheme.headingSmall.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.go('/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              context.go('/login');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.sidebarBackground,
        child: _buildSidebar(location, isDrawer: true),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getBottomNavIndex(location),
        onTap: (index) => _onBottomNavTapped(index, context),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.point_of_sale_outlined), label: 'Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.sensors_outlined), label: 'IoT/PLC'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'All Modules'),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AuthState authState) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppColors.topBarBackground,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isSidebarCollapsed ? Icons.menu_open_rounded : Icons.menu_rounded,
              color: AppColors.textSecondary,
            ),
            onPressed: () => setState(() => _isSidebarCollapsed = !_isSidebarCollapsed),
          ),
          AppSpacing.gapMd,

          // Live Quick Search
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => context.go('/search'),
                borderRadius: AppRadius.rMd,
                child: Container(
                  width: 320,
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: AppRadius.rMd,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, size: 16, color: AppColors.textMuted),
                      AppSpacing.gapSm,
                      Expanded(
                        child: Text(
                          'Omni-Search ERP (Ctrl + K)...',
                          style: AppTextTheme.bodySmall.copyWith(color: AppColors.textMuted),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Realtime Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.tealLight,
              borderRadius: AppRadius.rRound,
              border: Border.all(color: AppColors.teal.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: AppColors.teal, shape: BoxShape.circle),
                ),
                const SizedBox(width: 6),
                Text(
                  'TELEMETRY LIVE',
                  style: AppTextTheme.labelSmall.copyWith(color: AppColors.teal, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          AppSpacing.gapMd,

          // Notifications Icon with Badge
          IconButton(
            icon: Badge(
              label: const Text('3'),
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.notifications_outlined, color: AppColors.textSecondary),
            ),
            onPressed: () => context.go('/notifications'),
          ),
          AppSpacing.gapSm,

          // User Profile Menu
          PopupMenuButton<String>(
            offset: const Offset(0, 48),
            onSelected: (val) {
              if (val == 'logout') {
                ref.read(authProvider.notifier).logout();
                context.go('/login');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authState.userName ?? 'Marcus Vance', style: AppTextTheme.labelLarge),
                    Text(authState.userRole ?? 'System Administrator', style: AppTextTheme.bodySmall),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined, size: 18),
                    SizedBox(width: 8),
                    Text('System Settings'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded, size: 18, color: AppColors.error),
                    SizedBox(width: 8),
                    Text('Sign Out', style: TextStyle(color: AppColors.error)),
                  ],
                ),
              ),
            ],
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryLight,
                  child: Text(
                    (authState.userName ?? 'MV').substring(0, 2).toUpperCase(),
                    style: AppTextTheme.labelMedium.copyWith(color: AppColors.primaryDark),
                  ),
                ),
                if (!_isSidebarCollapsed) ...[
                  AppSpacing.gapSm,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        authState.userName ?? 'Marcus Vance',
                        style: AppTextTheme.labelMedium.copyWith(color: AppColors.textPrimary),
                      ),
                      Text(
                        'Admin',
                        style: AppTextTheme.labelSmall.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_drop_down, size: 18, color: AppColors.textSecondary),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(String currentRoute, {bool isDrawer = false}) {
    return Column(
      children: [
        // Sidebar Brand Header
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppRadius.rSm,
                ),
                child: const Icon(
                  Icons.precision_manufacturing_rounded,
                  color: AppColors.textInverse,
                  size: 20,
                ),
              ),
              if (!_isSidebarCollapsed || isDrawer) ...[
                AppSpacing.gapSm,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COMPANY ERP',
                        style: AppTextTheme.labelLarge.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.2,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'v1.0 Production Prototype',
                        style: AppTextTheme.labelSmall.copyWith(
                          color: AppColors.primaryDark,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),

        // Navigation Scroll List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            children: [
              for (final group in navGroups) ...[
                if (!_isSidebarCollapsed || isDrawer)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.md, 14, AppSpacing.md, 6),
                    child: Text(
                      group.title,
                      style: AppTextTheme.labelSmall.copyWith(
                        color: AppColors.textMuted,
                        letterSpacing: 0.8,
                        fontSize: 10,
                      ),
                    ),
                  ),
                for (final entry in group.entries)
                  _buildNavItem(entry, currentRoute, isDrawer: isDrawer),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(NavEntry entry, String currentRoute, {bool isDrawer = false}) {
    final isSelected = currentRoute == entry.route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      child: Material(
        color: isSelected ? AppColors.primaryLight : Colors.transparent,
        borderRadius: AppRadius.rMd,
        child: InkWell(
          onTap: () {
            if (isDrawer) Navigator.of(context).pop();
            context.go(entry.route);
          },
          borderRadius: AppRadius.rMd,
          hoverColor: AppColors.primaryLight.withValues(alpha: 0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _isSidebarCollapsed && !isDrawer ? 12 : AppSpacing.md,
              vertical: 9,
            ),
            child: Row(
              children: [
                Icon(
                  entry.icon,
                  size: 20,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
                if (!_isSidebarCollapsed || isDrawer) ...[
                  AppSpacing.gapMd,
                  Expanded(
                    child: Text(
                      entry.title,
                      style: AppTextTheme.bodyMedium.copyWith(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? AppColors.primaryDark : AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (entry.badgeCount != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: AppRadius.rRound,
                      ),
                      child: Text(
                        '${entry.badgeCount}',
                        style: AppTextTheme.labelSmall.copyWith(color: AppColors.textInverse),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
