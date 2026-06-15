import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class LibraryEmptyState extends StatelessWidget {
  const LibraryEmptyState({super.key, this.onRecordQuotePressed});

  final VoidCallback? onRecordQuotePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 420),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _EmptyArchiveIcon(),
          const SizedBox(height: 32),
          Text(
            l10n.libraryEmptyTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: BookcatchColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.libraryEmptyBody,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: BookcatchColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: onRecordQuotePressed,
            icon: const Icon(Icons.add_circle_outline),
            label: Text(l10n.libraryEmptyAction),
            style: FilledButton.styleFrom(
              minimumSize: const Size(180, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyArchiveIcon extends StatelessWidget {
  const _EmptyArchiveIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -16,
          left: -16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: BookcatchColors.surfaceContainerHigh.withValues(
                alpha: 0.34,
              ),
              shape: BoxShape.circle,
            ),
            child: const SizedBox.square(dimension: 96),
          ),
        ),
        Material(
          color: BookcatchColors.surfaceContainerLowest,
          elevation: 4,
          shadowColor: BookcatchColors.primary.withValues(alpha: 0.08),
          surfaceTintColor: Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          child: const SizedBox.square(
            dimension: 128,
            child: Icon(
              Icons.inventory_2_outlined,
              color: BookcatchColors.primary,
              size: 64,
            ),
          ),
        ),
        Positioned(
          right: -12,
          bottom: -8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: BookcatchColors.secondary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const SizedBox.square(dimension: 48),
          ),
        ),
      ],
    );
  }
}
