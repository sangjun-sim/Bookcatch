import 'package:flutter/material.dart';

abstract final class BookcatchTextStyles {
  static const displayLarge = TextStyle(
    fontSize: 48,
    height: 1.1,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.0,
  );

  static const headlineLarge = TextStyle(
    fontSize: 32,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.6,
  );

  static const headlineLargeMobile = TextStyle(
    fontSize: 28,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const headlineMedium = TextStyle(
    fontSize: 24,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
  );

  static const headlineSmall = TextStyle(
    fontSize: 20,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  );

  static const bodyLarge = TextStyle(
    fontSize: 18,
    height: 1.6,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static const bodyMedium = TextStyle(
    fontSize: 16,
    height: 1.6,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static const labelMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    height: 1.6,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static const caption = TextStyle(
    fontSize: 12,
    height: 1.4,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );
}
