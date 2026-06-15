import 'package:bookcatch/features/home/models/home_quote.dart';
import 'package:bookcatch/features/home/widgets/quote_label_chip.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class RecentQuoteCard extends StatelessWidget {
  const RecentQuoteCard({
    super.key,
    required this.quote,
    required this.savedAtLabel,
    this.onPressed,
  });

  final HomeQuote quote;
  final String savedAtLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SizedBox(
      width: 280,
      child: Material(
        color: BookcatchColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: BookcatchColors.outlineVariant),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    for (final labelId in quote.labelIds)
                      QuoteLabelChip(labelId: labelId),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '"${quote.text}"',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: BookcatchColors.onSurface,
                  ),
                ),
                const Spacer(),
                const Divider(color: BookcatchColors.outlineVariant),
                Text(
                  l10n.quoteSource(quote.author, quote.bookTitle),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: BookcatchColors.onSurface,
                  ),
                ),
                Text(
                  savedAtLabel,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: BookcatchColors.onSurfaceVariant,
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
