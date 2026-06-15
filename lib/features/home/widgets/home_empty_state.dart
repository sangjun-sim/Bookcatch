import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key, this.onCaptureQuotePressed});

  final VoidCallback? onCaptureQuotePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _EmptyIllustration(),
        const SizedBox(height: 24),
        Text(
          l10n.homeEmptyTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: BookcatchColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.homeEmptyBody,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: BookcatchColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: FilledButton.icon(
            onPressed: onCaptureQuotePressed,
            icon: const Icon(Icons.add_circle),
            label: Text(l10n.homeEmptyAction),
            style: FilledButton.styleFrom(
              minimumSize: const Size(260, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        Opacity(
          opacity: 0.34,
          child: Column(
            children: [
              const Icon(
                Icons.format_quote,
                size: 48,
                color: BookcatchColors.primary,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.homeEmptyFooterQuote,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: BookcatchColors.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyIllustration extends StatelessWidget {
  const _EmptyIllustration();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: BookcatchColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: BookcatchColors.outlineVariant),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.auto_stories_outlined,
                  size: 128,
                  color: BookcatchColors.primary.withValues(alpha: 0.28),
                ),
                Positioned(
                  right: 44,
                  bottom: 52,
                  child: Icon(
                    Icons.edit_note_outlined,
                    size: 72,
                    color: BookcatchColors.secondary.withValues(alpha: 0.42),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
