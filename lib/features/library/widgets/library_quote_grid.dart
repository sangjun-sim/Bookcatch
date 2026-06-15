import 'package:bookcatch/features/library/models/library_quote.dart';
import 'package:bookcatch/features/library/widgets/library_quote_card.dart';
import 'package:flutter/material.dart';

class LibraryQuoteGrid extends StatelessWidget {
  const LibraryQuoteGrid({
    super.key,
    required this.quotes,
    this.onQuotePressed,
    required this.onFavoritePressed,
    this.onEditPressed,
    this.onMoveFolderPressed,
    this.onReminderPressed,
    this.onExportMarkdownPressed,
    this.onDeletePressed,
  });

  final List<LibraryQuote> quotes;
  final ValueChanged<LibraryQuote>? onQuotePressed;
  final ValueChanged<LibraryQuote> onFavoritePressed;
  final ValueChanged<LibraryQuote>? onEditPressed;
  final ValueChanged<LibraryQuote>? onMoveFolderPressed;
  final ValueChanged<LibraryQuote>? onReminderPressed;
  final ValueChanged<LibraryQuote>? onExportMarkdownPressed;
  final ValueChanged<LibraryQuote>? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 620;
        final width = isWide
            ? (constraints.maxWidth - 16) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final quote in quotes)
              SizedBox(
                width: width,
                child: LibraryQuoteCard(
                  quote: quote,
                  onPressed: onQuotePressed == null
                      ? null
                      : () => onQuotePressed!(quote),
                  onFavoritePressed: () => onFavoritePressed(quote),
                  onEditPressed: onEditPressed == null
                      ? null
                      : () => onEditPressed!(quote),
                  onMoveFolderPressed: onMoveFolderPressed == null
                      ? null
                      : () => onMoveFolderPressed!(quote),
                  onReminderPressed: onReminderPressed == null
                      ? null
                      : () => onReminderPressed!(quote),
                  onExportMarkdownPressed: onExportMarkdownPressed == null
                      ? null
                      : () => onExportMarkdownPressed!(quote),
                  onDeletePressed: onDeletePressed == null
                      ? null
                      : () => onDeletePressed!(quote),
                ),
              ),
          ],
        );
      },
    );
  }
}
