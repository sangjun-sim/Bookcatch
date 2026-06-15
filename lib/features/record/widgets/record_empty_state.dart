import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class RecordEmptyState extends StatelessWidget {
  const RecordEmptyState({super.key, required this.onStartRecordingPressed});

  final VoidCallback onStartRecordingPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 120),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 520),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _RecordEmptyIconCluster(),
              const SizedBox(height: 32),
              Text(
                l10n.recordEmptyTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: BookcatchColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.recordEmptyBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: BookcatchColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: onStartRecordingPressed,
                icon: const Icon(Icons.add_circle),
                label: Text(l10n.recordEmptyAction),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.recordEmptyHelper,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: BookcatchColors.outline,
                ),
              ),
              const SizedBox(height: 48),
              const _QuoteDivider(),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecordEmptyIconCluster extends StatelessWidget {
  const _RecordEmptyIconCluster();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: BookcatchColors.primary.withValues(alpha: 0.05),
            shape: BoxShape.circle,
          ),
          child: const SizedBox.square(dimension: 160),
        ),
        Material(
          color: BookcatchColors.surfaceContainerLowest,
          elevation: 4,
          shadowColor: BookcatchColors.primary.withValues(alpha: 0.08),
          surfaceTintColor: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: const Padding(
            padding: EdgeInsets.all(28),
            child: Icon(
              Icons.auto_stories_outlined,
              color: BookcatchColors.primary,
              size: 64,
            ),
          ),
        ),
        Positioned(
          top: -4,
          right: 8,
          child: _FloatingIcon(
            icon: Icons.edit_outlined,
            color: BookcatchColors.secondary,
            backgroundColor: BookcatchColors.surfaceContainer,
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          child: _FloatingIcon(
            icon: Icons.history_outlined,
            color: BookcatchColors.primary,
            backgroundColor: BookcatchColors.surfaceContainerLow,
          ),
        ),
      ],
    );
  }
}

class _FloatingIcon extends StatelessWidget {
  const _FloatingIcon({
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  final IconData icon;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }
}

class _QuoteDivider extends StatelessWidget {
  const _QuoteDivider();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 48, child: Divider()),
          const SizedBox(width: 12),
          Icon(Icons.format_quote, color: BookcatchColors.outline),
          const SizedBox(width: 12),
          const SizedBox(width: 48, child: Divider()),
        ],
      ),
    );
  }
}
