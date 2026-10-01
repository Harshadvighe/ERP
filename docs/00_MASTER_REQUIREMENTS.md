# Master Requirements Specification: Company ERP Platform

## 1. Executive Summary
This document specifies the authoritative functional, technical, safety, security, and UI/UX requirements for the Company ERP Platform.

---

## 2. Multi-Platform Client Requirements (Flutter)
- **Shared Codebase**: Core domain models, state management, validation, business presentation logic, and repository interfaces must be 100% shared across:
  - Web (HTML5 CanvasKit / Wasm)
  - Windows Desktop (x64)
  - Android (API level 24+)
  - iOS (iOS 15+)
- **Responsive Navigation**:
  - Desktop / Web (≥ 1024px): Full Sidebar Navigation with collapsible hierarchy, breadcrumb trail, and top global control bar.
  - Tablet (600px - 1023px): Collapsible `NavigationRail` with quick action menus.
  - Mobile (< 600px): Bottom Navigation Bar with adaptive Drawer and Modal Bottom Sheets.
- **Enterprise Visual Standards**:
  - Cohesive design system with semantic color palette, strict spacing grid (4px/8px/16px/24px/32px), typography scale, and elevation tokens.
  - Every view must provide explicit Loading (skeleton), Empty (actionable illustration/text), Error (with retry trigger), and Data States.

---

## 3. Backend Core Requirements (NestJS)
- **Framework & Language**: NestJS 10 on Node.js 20 LTS, TypeScript 5.
- **Layered Clean Architecture**: Controllers -> Guards -> Validation Pipes -> Services -> Prisma Data Access -> PostgreSQL.
- **Validation**: Strict runtime validation of all inputs via `class-validator` and `class-transformer`.
- **Asynchronous Task Processing**: Background job processing via BullMQ backed by Redis for PDF/report generation, emails, bulk imports, and telemetry batching.
- **Security & RBAC**:
  - JWT Access/Refresh tokens with secure revocation.
  - Granular permission checking on all endpoints.
  - Immutable audit logging on all state-mutating actions (`POST`, `PATCH`, `PUT`, `DELETE`).

---

## 4. Industrial IoT, Telemetry & PLC Safety Requirements
- **Industrial Safety Principle**: The Flutter client MUST NEVER directly communicate with or control PLCs. All machine commands route through NestJS Backend -> Security & Interlock Verification -> Audit Log -> Edge Industrial Gateway -> Physical PLC.
- **Fail-Safe & Interlocks**: Critical safety interlocks MUST remain on the physical hardware/PLC layer. The software UI serves as an authenticated supervisory command interface with mandatory double-confirmation / PIN prompt.
- **Real-Time Telemetry Pipeline**:
  - Ingestion via MQTT 5.0 broker (EMQX).
  - High-frequency telemetry streamed to clients via WebSockets.
  - Visual status indicators in UI: `LIVE`, `DELAYED`, `OFFLINE`, `UNKNOWN`. Never display stale data as live.

---

## 5. Database & Integrity Requirements
- **Database Engine**: PostgreSQL 16 managed via Prisma ORM.
- **Strict Data Integrity**:
  - Primary keys, foreign keys with `ON DELETE RESTRICT` for primary operational records.
  - Decimal precision for financials and inventory.
  - Optimistic concurrency control via `version` columns.
  - All multi-table updates encapsulated within database transactions.

---

## 6. Testing & Quality Gate Requirements
- **Unit & Integration Tests**: All backend business logic and Flutter providers/repositories must have test suites.
- **Cross-Platform Verification**: Tests executed for Android, Web, and Windows. iOS builds executed in macOS CI environment; reported as `NOT EXECUTED - environment limitation` when on Windows.
- **Zero Critical Bugs**: All P0 (blocker) and P1 (critical) issues must be resolved before any module is marked complete.
