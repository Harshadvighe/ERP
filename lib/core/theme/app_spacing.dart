import 'package:flutter/material.dart';

/// Centralized Enterprise Spacing Grid
class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Insets
  static const EdgeInsets pXs = EdgeInsets.all(xs);
  static const EdgeInsets pSm = EdgeInsets.all(sm);
  static const EdgeInsets pMd = EdgeInsets.all(md);
  static const EdgeInsets pLg = EdgeInsets.all(lg);
  static const EdgeInsets pXl = EdgeInsets.all(xl);

  // Horizontal Insets
  static const EdgeInsets phSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets phMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets phLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets phXl = EdgeInsets.symmetric(horizontal: xl);

  // Vertical Insets
  static const EdgeInsets pvXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets pvSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets pvMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets pvLg = EdgeInsets.symmetric(vertical: lg);

  // Gaps
  static const SizedBox gapXxs = SizedBox(width: xxs, height: xxs);
  static const SizedBox gapXs = SizedBox(width: xs, height: xs);
  static const SizedBox gapSm = SizedBox(width: sm, height: sm);
  static const SizedBox gapMd = SizedBox(width: md, height: md);
  static const SizedBox gapLg = SizedBox(width: lg, height: lg);
  static const SizedBox gapXl = SizedBox(width: xl, height: xl);
}
