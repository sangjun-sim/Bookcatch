import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

abstract final class BookcatchTheme {
  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: BookcatchColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: BookcatchColors.primary,
          onPrimary: BookcatchColors.onPrimary,
          primaryContainer: BookcatchColors.primaryContainer,
          onPrimaryContainer: BookcatchColors.onPrimaryContainer,
          secondary: BookcatchColors.secondary,
          surface: BookcatchColors.surface,
          onSurface: BookcatchColors.onSurface,
          outline: BookcatchColors.outline,
          outlineVariant: BookcatchColors.outlineVariant,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: BookcatchColors.surface,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: BookcatchColors.surface,
        foregroundColor: BookcatchColors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: BookcatchTextStyles.headlineSmall.copyWith(
          color: BookcatchColors.primary,
          fontWeight: FontWeight.w700,
        ),
        shape: const Border(
          bottom: BorderSide(color: BookcatchColors.outlineVariant),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: BookcatchColors.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 72,
        indicatorColor: BookcatchColors.surfaceContainer,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? BookcatchColors.primary
                : BookcatchColors.onSurfaceVariant,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => BookcatchTextStyles.labelSmall.copyWith(
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? BookcatchColors.primary
                : BookcatchColors.onSurfaceVariant,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: BookcatchColors.primary,
        foregroundColor: BookcatchColors.onPrimary,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: BookcatchColors.primary,
          foregroundColor: BookcatchColors.onPrimary,
          minimumSize: const Size(48, 44),
          textStyle: BookcatchTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: BookcatchColors.primary,
          side: const BorderSide(color: BookcatchColors.outlineVariant),
          minimumSize: const Size(48, 44),
          textStyle: BookcatchTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: BookcatchColors.secondary,
          minimumSize: const Size(48, 44),
          textStyle: BookcatchTextStyles.labelMedium,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: BookcatchColors.outlineVariant,
        thickness: 1,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: BookcatchColors.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: BookcatchColors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: BookcatchColors.onSurface,
        contentTextStyle: BookcatchTextStyles.labelMedium.copyWith(
          color: BookcatchColors.surface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme:
          const TextTheme(
            displayLarge: BookcatchTextStyles.displayLarge,
            headlineLarge: BookcatchTextStyles.headlineLarge,
            headlineMedium: BookcatchTextStyles.headlineMedium,
            headlineSmall: BookcatchTextStyles.headlineSmall,
            titleMedium: BookcatchTextStyles.bodyMedium,
            bodyLarge: BookcatchTextStyles.bodyLarge,
            bodyMedium: BookcatchTextStyles.bodyMedium,
            labelLarge: BookcatchTextStyles.labelMedium,
            labelMedium: BookcatchTextStyles.labelMedium,
            labelSmall: BookcatchTextStyles.labelSmall,
          ).apply(
            bodyColor: BookcatchColors.onSurface,
            displayColor: BookcatchColors.onSurface,
          ),
    );
  }
}
