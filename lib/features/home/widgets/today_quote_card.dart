import 'package:bookcatch/features/home/models/home_quote.dart';
import 'package:bookcatch/features/quotes/quote_source_formatter.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_quote_mark.dart';
import 'package:flutter/material.dart';

class TodayQuoteCard extends StatelessWidget {
  const TodayQuoteCard({
    super.key,
    required this.quote,
    this.onSharePressed,
    this.onOpenPressed,
  });

  final HomeQuote quote;
  final ValueChanged<Rect?>? onSharePressed;
  final VoidCallback? onOpenPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final source = formatQuoteSource(
      l10n,
      author: quote.author,
      bookTitle: quote.bookTitle,
      page: quote.page,
    );

    return Material(
      color: Colors.transparent,
      elevation: 10,
      shadowColor: BookcatchColors.primary.withValues(alpha: 0.16),
      surfaceTintColor: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onOpenPressed,
        borderRadius: BorderRadius.circular(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  BookcatchColors.primaryContainer,
                  BookcatchColors.secondary,
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -16,
                  right: -16,
                  child: BookcatchQuoteMark(
                    size: 120,
                    color: BookcatchColors.surface.withValues(alpha: 0.10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Pill(label: l10n.todayUnderlineTitle),
                      const SizedBox(height: 16),
                      Text(
                        '"${quote.text}"',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: BookcatchColors.onPrimaryContainer,
                          fontStyle: FontStyle.italic,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Color(0x33FFF9EE), height: 1),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            source,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: BookcatchColors.onPrimaryContainer,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: onSharePressed == null
                                ? null
                                : () => onSharePressed!(
                                    _sharePositionOrigin(context),
                                  ),
                            icon: const Icon(Icons.share_outlined, size: 18),
                            label: Text(l10n.shareAction),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: BookcatchColors.surface,
                              side: BorderSide(
                                color: BookcatchColors.surface.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              backgroundColor: BookcatchColors.surface
                                  .withValues(alpha: 0.1),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Rect? _sharePositionOrigin(BuildContext context) {
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) {
      return null;
    }
    return renderObject.localToGlobal(Offset.zero) & renderObject.size;
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.surface.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: BookcatchColors.surface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
