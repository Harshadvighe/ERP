import '../../shared/models/status_type.dart';

/// Centralized, Explicitly Isolated Demo Data Store for Frontend-First Prototype
class DemoDataStore {
  DemoDataStore._();

  // Dashboard Overview KPIs
  static const Map<String, dynamic> dashboardKpis = {
    'revenue': {'label': 'Total Revenue (MTD)', 'value': '\$1,428,950', 'change': '+14.2%', 'isPositive': true},
    'orders': {'label': 'Active Sales Orders', 'value': '342', 'change': '+8.5%', 'isPositive': true},
    'production': {'label': 'Plant Output Rate', 'value': '94.8%', 'change': '+2.1%', 'isPositive': true},
    'inventory': {'label': 'Inventory Valuation', 'value': '\$4,892,100', 'change': '-1.4%', 'isPositive': false},
    'machines': {'label': 'OEE Operational Index', 'value': '88.6%', 'change': '+3.4%', 'isPositive': true},
    'employees': {'label': 'Workforce Present', 'value': '1,280 / 1,320', 'change': '97.0%', 'isPositive': true},
  };

  // Customers Demo Data
  static final List<Map<String, dynamic>> customers = [
    {
      'id': 'CUST-1001',
      'name': 'Apex Industrial Automation Ltd',
      'contactPerson': 'Marcus Vance',
      'email': 'm.vance@apexindustrial.com',
      'phone': '+1 (555) 234-8901',
      'industry': 'Automotive & Heavy Fab',
      'creditLimit': '\$500,000',
      'balance': '\$142,500',
      'status': AppStatusType.active,
    },
    {
      'id': 'CUST-1002',
      'name': 'Titan Dynamics Corp',
      'contactPerson': 'Sarah Jenkins',
      'email': 's.jenkins@titandynamics.io',
      'phone': '+1 (555) 876-1234',
      'industry': 'Aerospace Machinery',
      'creditLimit': '\$1,000,000',
      'balance': '\$389,200',
      'status': AppStatusType.active,
    },
    {
      'id': 'CUST-1003',
      'name': 'Nordic Robotics AB',
      'contactPerson': 'Lars Lindqvist',
      'email': 'lars@nordicrobotics.se',
      'phone': '+46 8 123 4567',
      'industry': 'Industrial Robotics',
      'creditLimit': '\$750,000',
      'balance': '\$0',
      'status': AppStatusType.active,
    },
    {
      'id': 'CUST-1004',
      'name': 'SinoPrecision Engineering',
      'contactPerson': 'Wei Zhang',
      'email': 'w.zhang@sinoprecision.cn',
      'phone': '+86 21 8876 5432',
      'industry': 'Precision Tooling',
      'creditLimit': '\$300,000',
      'balance': '\$85,400',
      'status': AppStatusType.pending,
    },
  ];

  // Leads Demo Data
  static final List<Map<String, dynamic>> leads = [
    {
      'id': 'LEAD-801',
      'company': 'Quantum Turbines Inc',
      'leadName': 'David Miller',
      'value': '\$450,000',
      'stage': 'Proposal Sent',
      'probability': '75%',
      'source': 'Direct Referral',
      'assignedTo': 'Elena Rostova',
      'status': AppStatusType.pending,
    },
    {
      'id': 'LEAD-802',
      'company': 'Solaris Green Tech',
      'leadName': 'Amara Okafor',
      'value': '\$180,000',
      'stage': 'Qualified Discovery',
      'probability': '50%',
      'source': 'Hannover Messe 2026',
      'assignedTo': 'Michael Chang',
      'status': AppStatusType.active,
    },
    {
      'id': 'LEAD-803',
      'company': 'Vanguard Micro-Foundry',
      'leadName': 'Robert Sterling',
      'value': '\$920,000',
      'stage': 'Contract Negotiation',
      'probability': '90%',
      'source': 'Inbound RFQ',
      'assignedTo': 'Elena Rostova',
      'status': AppStatusType.active,
    },
  ];

  // Quotations Demo Data
  static final List<Map<String, dynamic>> quotations = [
    {
      'id': 'QT-2026-0041',
      'customer': 'Apex Industrial Automation Ltd',
      'date': '2026-09-28',
      'itemsCount': 8,
      'amount': '\$184,200.00',
      'validUntil': '2026-10-28',
      'status': AppStatusType.approved,
    },
    {
      'id': 'QT-2026-0042',
      'customer': 'Titan Dynamics Corp',
      'date': '2026-09-30',
      'itemsCount': 14,
      'amount': '\$512,800.00',
      'validUntil': '2026-10-30',
      'status': AppStatusType.pending,
    },
    {
      'id': 'QT-2026-0043',
      'customer': 'Nordic Robotics AB',
      'date': '2026-10-01',
      'itemsCount': 3,
      'amount': '\$64,500.00',
      'validUntil': '2026-11-01',
      'status': AppStatusType.draft,
    },
  ];

  // Sales Orders Demo Data
  static final List<Map<String, dynamic>> salesOrders = [
    {
      'id': 'SO-9021',
      'customer': 'Apex Industrial Automation Ltd',
      'orderDate': '2026-09-20',
      'deliveryDate': '2026-10-15',
      'total': '\$184,200.00',
      'fulfillment': '80% Dispatched',
      'status': AppStatusType.running,
    },
    {
      'id': 'SO-9022',
      'customer': 'Nordic Robotics AB',
      'orderDate': '2026-09-22',
      'deliveryDate': '2026-10-08',
      'total': '\$320,000.00',
      'fulfillment': '100% Ready',
      'status': AppStatusType.completed,
    },
    {
      'id': 'SO-9023',
      'customer': 'Titan Dynamics Corp',
      'orderDate': '2026-09-29',
      'deliveryDate': '2026-10-25',
      'total': '\$475,500.00',
      'fulfillment': 'In Production',
      'status': AppStatusType.pending,
    },
  ];

  // Inventory & Stock Demo Data
  static final List<Map<String, dynamic>> inventoryItems = [
    {
      'sku': 'SKU-SERVO-8800',
      'name': 'High-Torque AC Servo Motor 7.5kW',
      'category': 'Electrical Drives',
      'warehouse': 'WH-Central Plant A',
      'stockOnHand': 142,
      'allocated': 60,
      'available': 82,
      'reorderLevel': 40,
      'unitCost': '\$480.00',
      'status': AppStatusType.active,
    },
    {
      'sku': 'SKU-PLC-S7-1500',
      'name': 'Siemens S7-1500 CPU 1515-2 PN',
      'category': 'Automation Controllers',
      'warehouse': 'WH-Electronics B',
      'stockOnHand': 18,
      'allocated': 12,
      'available': 6,
      'reorderLevel': 15,
      'unitCost': '\$1,850.00',
      'status': AppStatusType.pending,
    },
    {
      'sku': 'SKU-BRG-CERAMIC-45',
      'name': 'High-Speed Ceramic Hybrid Bearing 45mm',
      'category': 'Mechanical Spares',
      'warehouse': 'WH-Central Plant A',
      'stockOnHand': 480,
      'allocated': 110,
      'available': 370,
      'reorderLevel': 100,
      'unitCost': '\$92.00',
      'status': AppStatusType.active,
    },
    {
      'sku': 'SKU-VFD-ABB-580',
      'name': 'ABB ACH580 Variable Frequency Drive 15kW',
      'category': 'Power Electronics',
      'warehouse': 'WH-Central Plant A',
      'stockOnHand': 5,
      'allocated': 5,
      'available': 0,
      'reorderLevel': 8,
      'unitCost': '\$2,100.00',
      'status': AppStatusType.fault,
    },
  ];

  // Production Orders Demo Data
  static final List<Map<String, dynamic>> productionOrders = [
    {
      'id': 'PO-PRD-4401',
      'product': 'Robotic Arm 6-Axis Assembly (Model X6)',
      'batchNo': 'LOT-2026-X6-09',
      'plannedQty': 25,
      'completedQty': 18,
      'progress': 0.72,
      'line': 'Assembly Line 01',
      'startDate': '2026-09-25',
      'targetDate': '2026-10-05',
      'status': AppStatusType.running,
    },
    {
      'id': 'PO-PRD-4402',
      'product': 'CNC Precision Spindle Head Type-B',
      'batchNo': 'LOT-2026-SP-12',
      'plannedQty': 50,
      'completedQty': 50,
      'progress': 1.0,
      'line': 'Machining Cell 03',
      'startDate': '2026-09-20',
      'targetDate': '2026-09-30',
      'status': AppStatusType.completed,
    },
    {
      'id': 'PO-PRD-4403',
      'product': 'High-Pressure Hydraulic Valve Block',
      'batchNo': 'LOT-2026-HYD-04',
      'plannedQty': 120,
      'completedQty': 34,
      'progress': 0.28,
      'line': 'Milling Center 02',
      'startDate': '2026-09-29',
      'targetDate': '2026-10-10',
      'status': AppStatusType.running,
    },
  ];

  // Machine Monitoring Live Demo Data
  static final List<Map<String, dynamic>> machines = [
    {
      'id': 'MCH-CNC-01',
      'name': '5-Axis DMG Mori CNC Milling Center',
      'plant': 'Plant 1 - Machining Bay A',
      'status': AppStatusType.running,
      'oee': '91.4%',
      'spindleSpeed': '14,250 RPM',
      'temperature': '42.8 °C',
      'vibration': '0.84 mm/s',
      'feedRate': '100%',
      'uptime': '184 hrs',
      'currentJob': 'PO-PRD-4403 (Part #48)',
    },
    {
      'id': 'MCH-ROBOT-02',
      'name': 'KUKA KR-210 Heavy Payload Robot',
      'plant': 'Plant 1 - Automated Welding Cell',
      'status': AppStatusType.running,
      'oee': '94.8%',
      'spindleSpeed': 'N/A',
      'temperature': '38.2 °C',
      'vibration': '0.41 mm/s',
      'feedRate': '98%',
      'uptime': '312 hrs',
      'currentJob': 'PO-PRD-4401 (Chassis Weld)',
    },
    {
      'id': 'MCH-LATHE-03',
      'name': 'Okuma LB3000 CNC Turning Lathe',
      'plant': 'Plant 2 - Turning Line',
      'status': AppStatusType.idle,
      'oee': '76.2%',
      'spindleSpeed': '0 RPM',
      'temperature': '29.5 °C',
      'vibration': '0.08 mm/s',
      'feedRate': '0%',
      'uptime': '45 hrs',
      'currentJob': 'Awaiting Material Setup',
    },
    {
      'id': 'MCH-PRESS-04',
      'name': 'Schuler 400T Hydraulic Stamping Press',
      'plant': 'Plant 1 - Heavy Stamping',
      'status': AppStatusType.maintenance,
      'oee': '62.0%',
      'spindleSpeed': 'N/A',
      'temperature': '54.1 °C',
      'vibration': '2.14 mm/s',
      'feedRate': '0%',
      'uptime': '0 hrs (Interlock)',
      'currentJob': 'Scheduled Die Replacement',
    },
  ];

  // PLC Live SCADA Tags
  static final List<Map<String, dynamic>> plcTags = [
    {'tag': 'DB100.DBX0.0', 'name': 'MAIN_DRIVE_RUN_STATUS', 'type': 'BOOL', 'value': 'TRUE', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBD14', 'name': 'HYDRAULIC_PRESSURE_BAR', 'type': 'REAL', 'value': '184.6 bar', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBD18', 'name': 'BEARING_TEMP_FRONT_C', 'type': 'REAL', 'value': '44.2 °C', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBD22', 'name': 'SPINDLE_CURRENT_AMPS', 'type': 'REAL', 'value': '28.4 A', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBX4.2', 'name': 'SAFETY_LIGHT_CURTAIN_OK', 'type': 'BOOL', 'value': 'TRUE', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBX4.5', 'name': 'EMERGENCY_STOP_CIRCUIT', 'type': 'BOOL', 'value': 'HEALTHY (CLOSED)', 'quality': 'GOOD', 'status': AppStatusType.online},
    {'tag': 'DB100.DBD30', 'name': 'TOTAL_PARTS_COUNTER', 'type': 'DINT', 'value': '48,290 pcs', 'quality': 'GOOD', 'status': AppStatusType.online},
  ];

  // IoT Sensor Devices Demo Data
  static final List<Map<String, dynamic>> iotDevices = [
    {
      'deviceId': 'IOT-SENS-771',
      'name': 'Edge Vibration Sensor Node A1',
      'protocol': 'MQTT 5.0 (TLS)',
      'firmware': 'v2.4.1',
      'ip': '192.168.10.45',
      'battery': '96%',
      'signal': '-52 dBm',
      'lastPing': '2 seconds ago',
      'status': AppStatusType.online,
    },
    {
      'deviceId': 'IOT-GATEWAY-02',
      'name': 'Industrial Edge Gateway Advantech UNO',
      'protocol': 'OPC-UA / MQTT Bridge',
      'firmware': 'v3.1.0-LTS',
      'ip': '192.168.10.1',
      'battery': 'Mains Powered',
      'signal': 'Gigabit Eth',
      'lastPing': '1 second ago',
      'status': AppStatusType.online,
    },
    {
      'deviceId': 'IOT-ENV-TEMP-09',
      'name': 'Cleanroom Ambient Climate Sensor',
      'protocol': 'LoRaWAN / Gateway',
      'firmware': 'v1.8.4',
      'ip': '192.168.10.88',
      'battery': '84%',
      'signal': '-68 dBm',
      'lastPing': '14 seconds ago',
      'status': AppStatusType.online,
    },
  ];

  // Financial Invoices
  static final List<Map<String, dynamic>> invoices = [
    {
      'id': 'INV-2026-0881',
      'customer': 'Apex Industrial Automation Ltd',
      'issueDate': '2026-09-15',
      'dueDate': '2026-10-15',
      'amount': '\$184,200.00',
      'paidAmount': '\$184,200.00',
      'status': AppStatusType.completed,
    },
    {
      'id': 'INV-2026-0882',
      'customer': 'Titan Dynamics Corp',
      'issueDate': '2026-09-28',
      'dueDate': '2026-10-28',
      'amount': '\$389,200.00',
      'paidAmount': '\$0.00',
      'status': AppStatusType.pending,
    },
    {
      'id': 'INV-2026-0883',
      'customer': 'SinoPrecision Engineering',
      'issueDate': '2026-09-30',
      'dueDate': '2026-10-30',
      'amount': '\$85,400.00',
      'paidAmount': '\$40,000.00',
      'status': AppStatusType.pending,
    },
  ];

  // HR Employees Demo Data
  static final List<Map<String, dynamic>> employees = [
    {
      'id': 'EMP-0104',
      'name': 'Alexander Wright',
      'role': 'Lead Automation & Robotics Engineer',
      'department': 'Engineering & R&D',
      'email': 'a.wright@company-erp.com',
      'phone': '+1 (555) 441-9920',
      'status': AppStatusType.active,
    },
    {
      'id': 'EMP-0105',
      'name': 'Elena Rostova',
      'role': 'Senior VP of Enterprise Sales',
      'department': 'Sales & CRM',
      'email': 'e.rostova@company-erp.com',
      'phone': '+1 (555) 332-1188',
      'status': AppStatusType.active,
    },
    {
      'id': 'EMP-0106',
      'name': 'Marcus Brody',
      'role': 'Plant Operations Director',
      'department': 'Manufacturing & MES',
      'email': 'm.brody@company-erp.com',
      'phone': '+1 (555) 887-2244',
      'status': AppStatusType.active,
    },
    {
      'id': 'EMP-0107',
      'name': 'Sophia Chen',
      'role': 'Head of Corporate Finance',
      'department': 'Finance & Accounts',
      'email': 's.chen@company-erp.com',
      'phone': '+1 (555) 991-3377',
      'status': AppStatusType.active,
    },
  ];

  // Recent Audit Logs
  static final List<Map<String, dynamic>> auditLogs = [
    {
      'id': 'AUD-9921',
      'actor': 'admin@company-erp.com (Super Admin)',
      'action': 'PLC_SAFETY_OVERRIDE_ACKNOWLEDGE',
      'entity': 'Machine: MCH-PRESS-04',
      'ip': '10.0.4.18',
      'timestamp': '2026-10-01 13:24:08 UTC',
      'status': AppStatusType.approved,
    },
    {
      'id': 'AUD-9920',
      'actor': 's.chen@company-erp.com',
      'action': 'INVOICE_POSTED_GENERAL_LEDGER',
      'entity': 'Invoice: INV-2026-0881',
      'ip': '10.0.2.91',
      'timestamp': '2026-10-01 12:45:19 UTC',
      'status': AppStatusType.completed,
    },
    {
      'id': 'AUD-9919',
      'actor': 'm.brody@company-erp.com',
      'action': 'PRODUCTION_ORDER_RELEASE',
      'entity': 'Order: PO-PRD-4401',
      'ip': '10.0.3.12',
      'timestamp': '2026-10-01 11:10:44 UTC',
      'status': AppStatusType.active,
    },
  ];
}
