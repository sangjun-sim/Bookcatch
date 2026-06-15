import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/library/library_formatters.dart';
import 'package:bookcatch/features/library/models/library_quote.dart';
import 'package:bookcatch/features/quotes/quote_source_formatter.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_quote_mark.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

enum _LibraryQuoteAction { edit, moveFolder, reminder, exportMarkdown, delete }

class LibraryQuoteCard extends StatelessWidget {
  const LibraryQuoteCard({
    super.key,
    required this.quote,
    this.onPressed,
    this.onFavoritePressed,
    this.onEditPressed,
    this.onMoveFolderPressed,
    this.onReminderPressed,
    this.onExportMarkdownPressed,
    this.onDeletePressed,
  });

  final LibraryQuote quote;
  final VoidCallback? onPressed;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onMoveFolderPressed;
  final VoidCallback? onReminderPressed;
  final VoidCallback? onExportMarkdownPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final source = formatQuoteSource(
      l10n,
      author: quote.author,
      bookTitle: '',
      page: quote.page,
    );

    return Material(
      color: BookcatchColors.surfaceContainerLowest,
      elevation: 2,
      shadowColor: BookcatchColors.primary.withValues(alpha: 0.06),
      surfaceTintColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookcatchQuoteMark(
                    color: BookcatchColors.primary.withValues(alpha: 0.18),
                    size: 36,
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: quote.isFavorite
                        ? l10n.libraryFavoriteRemoveAction
                        : l10n.libraryFavoriteAddAction,
                    onPressed: onFavoritePressed,
                    icon: Icon(
                      quote.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: quote.isFavorite
                          ? BookcatchColors.secondary
                          : BookcatchColors.outline,
                    ),
                  ),
                  if (onEditPressed != null ||
                      onMoveFolderPressed != null ||
                      onReminderPressed != null ||
                      onExportMarkdownPressed != null ||
                      onDeletePressed != null)
                    PopupMenuButton<_LibraryQuoteAction>(
                      icon: const Icon(Icons.more_vert),
                      tooltip: l10n.libraryQuoteMoreActions,
                      onSelected: (action) {
                        switch (action) {
                          case _LibraryQuoteAction.edit:
                            onEditPressed?.call();
                            return;
                          case _LibraryQuoteAction.moveFolder:
                            onMoveFolderPressed?.call();
                            return;
                          case _LibraryQuoteAction.reminder:
                            onReminderPressed?.call();
                            return;
                          case _LibraryQuoteAction.exportMarkdown:
                            onExportMarkdownPressed?.call();
                            return;
                          case _LibraryQuoteAction.delete:
                            onDeletePressed?.call();
                            return;
                        }
                      },
                      itemBuilder: (context) => [
                        if (onEditPressed != null)
                          PopupMenuItem(
                            value: _LibraryQuoteAction.edit,
                            child: Text(l10n.libraryQuoteEditAction),
                          ),
                        if (onMoveFolderPressed != null)
                          PopupMenuItem(
                            value: _LibraryQuoteAction.moveFolder,
                            child: Text(l10n.libraryMoveToFolderAction),
                          ),
                        if (onReminderPressed != null)
                          PopupMenuItem(
                            value: _LibraryQuoteAction.reminder,
                            child: Text(l10n.libraryQuoteReminderAction),
                          ),
                        if (onExportMarkdownPressed != null)
                          PopupMenuItem(
                            value: _LibraryQuoteAction.exportMarkdown,
                            child: Text(l10n.libraryQuoteExportMarkdownAction),
                          ),
                        if (onDeletePressed != null)
                          PopupMenuItem(
                            value: _LibraryQuoteAction.delete,
                            child: Text(l10n.libraryQuoteDeleteAction),
                          ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '"${quote.text}"',
                style: BookcatchTextStyles.bodyLarge.copyWith(
                  color: BookcatchColors.textPrimary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: BookcatchColors.outlineVariant),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final labelId in quote.labelIds)
                    _LibraryLabel(
                      label: LabelCatalog.displayName(labelId, l10n),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                quote.bookTitle,
                style: BookcatchTextStyles.labelMedium.copyWith(
                  color: BookcatchColors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (source.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  source,
                  style: BookcatchTextStyles.labelSmall.copyWith(
                    color: BookcatchColors.outline,
                  ),
                ),
              ],
              const SizedBox(height: 6),
              Text(
                l10n.libraryRecordedAt(
                  LibraryFormatters.recordedAt(context, quote.createdAt),
                ),
                style: BookcatchTextStyles.labelSmall.copyWith(
                  color: BookcatchColors.outline,
                ),
              ),
              if (quote.reminderTime != null) ...[
                const SizedBox(height: 2),
                Text(
                  l10n.libraryQuoteReminderTime(
                    LibraryFormatters.reminderTime(
                      context: context,
                      hour: quote.reminderTime!.hour,
                      minute: quote.reminderTime!.minute,
                    ),
                  ),
                  style: BookcatchTextStyles.labelSmall.copyWith(
                    color: BookcatchColors.outline,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _LibraryLabel extends StatelessWidget {
  const _LibraryLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.tertiaryContainer.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          label,
          style: BookcatchTextStyles.caption.copyWith(
            color: BookcatchColors.onTertiaryContainer,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
