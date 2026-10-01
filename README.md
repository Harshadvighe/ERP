# Company ERP

## Project Overview
Company ERP is an enterprise-grade Industrial Operations Platform. It provides comprehensive modules across Administration, CRM, Finance, Procurement, Inventory, Manufacturing, HR, and Real-time Machine telemetry via Industrial IoT (SCADA/PLC).

## Current Development Phase
**FRONTEND FOUNDATION / UI PROTOTYPE PHASE**

The project is currently in the frontend prototype phase. The UI is completely interactive and responsive, using isolated mock datasets to visualize the target architecture. 
*Note: The backend, PostgreSQL database, real NestJS APIs, and live MQTT/PLC communication are NOT yet implemented.*

## Technology Stack
- **Frontend Framework:** Flutter 3.x / Dart 3.x
- **State Management:** Riverpod
- **Routing:** GoRouter
- **Design System:** Custom Enterprise Theme (Light Theme / Orange Brand Accent)

## Flutter Targets
- Android
- iOS
- Web
- Windows Desktop

## Project Structure
- `lib/app/`: Application shell, routing, responsive layouts.
- `lib/core/`: Theme, constants, utils, demo data layers.
- `lib/shared/`: Reusable enterprise widgets, models, form components.
- `lib/features/`: Modular business features (Auth, Dashboard, CRM, Inventory, Machines, etc.).
- `docs/`: Comprehensive master requirements and architecture planning.

## How to Run Locally

```bash
# Get dependencies
flutter pub get

# Run on Web (Chrome)
flutter run -d chrome

# Run on Windows Desktop
flutter run -d windows
```

## Current Status
- ✅ Master Requirements Defined
- ✅ Flutter Multi-Platform Setup
- ✅ Architecture & Routing
- ✅ Design System (Orange/Light Theme)
- ✅ Prototype Demo Data Layer
- ⏳ Backend / Database Integration (Next Phase)

## Future Architecture
The upcoming phases will transition the demo data layer to a live authoritative backend:
- **Backend:** NestJS (Node.js)
- **Database:** PostgreSQL (via Prisma ORM), Redis (Cache/Sessions)
- **Realtime / IoT:** MQTT Broker (EMQX), WebSocket API
- **Cloud/Infra:** AWS S3 for document storage, Docker, GitHub Actions
