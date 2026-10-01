import 'package:flutter/material.dart';

/// Centralized Orange Brand & Enterprise Palette
class AppColors {
  AppColors._();

  // Primary Orange Brand Colors
  static const Color primary = Color(0xFFF97316); // Vibrant Enterprise Orange
  static const Color primaryDark = Color(0xFFEA580C); // Darker Orange for hover/pressed
  static const Color primaryLight = Color(0xFFFFF7ED); // Very Light Orange tint for backgrounds
  static const Color primaryBorder = Color(0xFFFDBA74); // Orange border accent

  // Neutral Backgrounds & Surfaces (Light Theme)
  static const Color background = Color(0xFFF8FAFC); // Very light slate background
  static const Color surface = Color(0xFFFFFFFF); // Crisp White card surface
  static const Color surfaceHover = Color(0xFFF1F5F9); // Light hover
  static const Color sidebarBackground = Color(0xFFFFFFFF); // Pure white sidebar
  static const Color topBarBackground = Color(0xFFFFFFFF); // Pure white top bar

  // Enterprise Border & Divider Colors
  static const Color border = Color(0xFFE2E8F0); // Subtle slate border
  static const Color borderSubtle = Color(0xFFF1F5F9); // Very light divider
  static const Color borderFocus = Color(0xFFF97316); // Orange focus border

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Deep slate heading / primary text
  static const Color textSecondary = Color(0xFF64748B); // Slate secondary text
  static const Color textMuted = Color(0xFF94A3B8); // Muted / placeholder text
  static const Color textInverse = Color(0xFFFFFFFF); // White text

  // Semantic Status Colors
  static const Color success = Color(0xFF10B981); // Emerald Green
  static const Color successLight = Color(0xFFECFDF5);
  static const Color successBorder = Color(0xFFA7F3D0);

  static const Color warning = Color(0xFFF59E0B); // Amber Warning
  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color warningBorder = Color(0xFFFDE68A);

  static const Color error = Color(0xFFEF4444); // Crimson Red
  static const Color errorLight = Color(0xFFFEF2F2);
  static const Color errorBorder = Color(0xFFFECACA);

  static const Color info = Color(0xFF3B82F6); // Enterprise Blue
  static const Color infoLight = Color(0xFFEFF6FF);
  static const Color infoBorder = Color(0xFFBFDBFE);

  static const Color purple = Color(0xFF8B5CF6); // Maintenance Purple
  static const Color purpleLight = Color(0xFFF5F3FF);

  static const Color teal = Color(0xFF14B8A6); // Telemetry Teal
  static const Color tealLight = Color(0xFFF0FDFA);

  // Shadows
  static const BoxShadow shadowSm = BoxShadow(
    color: Color(0x08000000),
    blurRadius: 4,
    offset: Offset(0, 1),
  );

  static const BoxShadow shadowMd = BoxShadow(
    color: Color(0x0C000000),
    blurRadius: 8,
    offset: Offset(0, 2),
  );

  static const BoxShadow shadowLg = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 16,
    offset: Offset(0, 4),
  );
}
