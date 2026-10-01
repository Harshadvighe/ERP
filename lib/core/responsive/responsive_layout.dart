import 'package:flutter/material.dart';

enum DeviceScreenType {
  mobile,
  tablet,
  desktop,
}

/// Responsive Layout Utility & Breakpoint Handler
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static const double mobileMaxWidth = 768.0;
  static const double tabletMaxWidth = 1024.0;

  static DeviceScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileMaxWidth) {
      return DeviceScreenType.mobile;
    } else if (width < tabletMaxWidth) {
      return DeviceScreenType.tablet;
    }
    return DeviceScreenType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMaxWidth;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < tabletMaxWidth;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMaxWidth;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= tabletMaxWidth) {
      return desktop;
    }

    if (width >= mobileMaxWidth && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
