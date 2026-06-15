import 'package:bookcatch/features/library/models/library_folder.dart';
import 'package:bookcatch/features/library/models/library_quote.dart';
import 'package:bookcatch/features/library/widgets/library_empty_state.dart';
import 'package:bookcatch/features/library/widgets/library_folder_bar.dart';
import 'package:bookcatch/features/library/widgets/library_folder_empty_state.dart';
import 'package:bookcatch/features/library/widgets/library_folder_picker_sheet.dart';
import 'package:bookcatch/features/library/widgets/library_quote_grid.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

typedef LibraryFavoriteChanged =
    Future<void> Function(LibraryQuote quote, bool isFavorite);
typedef LibraryQuotePressed = Future<void> Function(LibraryQuote quote);
typedef LibraryQuoteDeleted = Future<void> Function(LibraryQuote quote);
typedef LibraryFolderCreated = Future<void> Function(String name);
typedef LibraryFolderDeleted = Future<void> Function(LibraryFolder folder);
typedef LibraryQuoteMovedToFolder =
    Future<void> Function(LibraryQuote quote, String? folderId);
typedef LibraryQuoteEdited = Future<void> Function(LibraryQuote quote);
typedef LibraryQuoteReminderPressed = Future<void> Function(LibraryQuote quote);
typedef LibraryQuoteExportMarkdownPressed =
    Future<void> Function(LibraryQuote quote);

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({
    super.key,
    this.quotes = const <LibraryQuote>[],
    this.folders = const <LibraryFolder>[],
    this.onRecordQuotePressed,
    this.onFavoriteChanged,
    this.onCreateFolder,
    this.onDeleteFolder,
    this.onMoveQuoteToFolder,
    this.onEditQuote,
    this.onQuotePressed,
    this.onQuoteReminderPressed,
    this.onExportMarkdownPressed,
    this.onDeleteQuote,
  });

  final List<LibraryQuote> quotes;
  final List<LibraryFolder> folders;
  final VoidCallback? onRecordQuotePressed;
  final LibraryFavoriteChanged? onFavoriteChanged;
  final LibraryFolderCreated? onCreateFolder;
  final LibraryFolderDeleted? onDeleteFolder;
  final LibraryQuoteMovedToFolder? onMoveQuoteToFolder;
  final LibraryQuoteEdited? onEditQuote;
  final LibraryQuotePressed? onQuotePressed;
  final LibraryQuoteReminderPressed? onQuoteReminderPressed;
  final LibraryQuoteExportMarkdownPressed? onExportMarkdownPressed;
  final LibraryQuoteDeleted? onDeleteQuote;

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String _selectedFolderId = LibraryFolderViewIds.all;
  final Map<String, bool> _pendingFavoriteOverrides = <String, bool>{};

  @override
  void didUpdateWidget(covariant LibraryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    final selectedFolderStillExists = widget.folders.any(
      (folder) => folder.id == _selectedFolderId,
    );
    if (_isUserFolderSelected && !selectedFolderStillExists) {
      _selectedFolderId = LibraryFolderViewIds.all;
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveQuotes = widget.quotes
        .map(
          (quote) =>
              quote.copyWith(isFavorite: _pendingFavoriteOverrides[quote.id]),
        )
        .toList();
    final visibleQuotes = _visibleQuotes(effectiveQuotes);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      children: [
        if (widget.quotes.isEmpty) ...[
          LibraryEmptyState(onRecordQuotePressed: widget.onRecordQuotePressed),
        ] else ...[
          LibraryFolderBar(
            folders: widget.folders,
            selectedFolderId: _selectedFolderId,
            onFolderSelected: _selectFolder,
            onCreateFolderPressed: widget.onCreateFolder == null
                ? null
                : _createFolder,
            onDeleteSelectedFolderPressed:
                widget.onDeleteFolder != null && _isUserFolderSelected
                ? _deleteSelectedFolder
                : null,
          ),
          const SizedBox(height: 32),
          if (visibleQuotes.isEmpty)
            const LibraryFolderEmptyState()
          else
            LibraryQuoteGrid(
              quotes: visibleQuotes,
              onQuotePressed: widget.onQuotePressed,
              onFavoritePressed: _toggleFavorite,
              onEditPressed: widget.onEditQuote,
              onMoveFolderPressed: widget.onMoveQuoteToFolder == null
                  ? null
                  : _moveQuoteToFolder,
              onReminderPressed: widget.onQuoteReminderPressed,
              onExportMarkdownPressed: widget.onExportMarkdownPressed,
              onDeletePressed: widget.onDeleteQuote,
            ),
        ],
      ],
    );
  }

  bool get _isUserFolderSelected {
    return !<String>{
      LibraryFolderViewIds.all,
      LibraryFolderViewIds.uncategorized,
      LibraryFolderViewIds.favorites,
    }.contains(_selectedFolderId);
  }

  List<LibraryQuote> _visibleQuotes(List<LibraryQuote> quotes) {
    return switch (_selectedFolderId) {
      LibraryFolderViewIds.uncategorized =>
        quotes.where((quote) => quote.folderId == null).toList(),
      LibraryFolderViewIds.favorites =>
        quotes.where((quote) => quote.isFavorite).toList(),
      LibraryFolderViewIds.all => quotes,
      _ =>
        quotes.where((quote) => quote.folderId == _selectedFolderId).toList(),
    };
  }

  void _selectFolder(String folderId) {
    if (folderId == _selectedFolderId) {
      return;
    }

    setState(() {
      _selectedFolderId = folderId;
    });
  }

  Future<void> _createFolder() async {
    final l10n = AppLocalizations.of(context);
    final name = await showCreateLibraryFolderDialog(context);
    if (name == null || name.isEmpty) {
      return;
    }

    try {
      await widget.onCreateFolder?.call(name);
    } on Object {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.libraryFolderCreateFailure)));
    }
  }

  Future<void> _deleteSelectedFolder() async {
    final l10n = AppLocalizations.of(context);
    LibraryFolder? folder;
    for (final candidate in widget.folders) {
      if (candidate.id == _selectedFolderId) {
        folder = candidate;
        break;
      }
    }
    if (folder == null) {
      return;
    }
    final selectedFolder = folder;
    final quoteCount = widget.quotes
        .where((quote) => quote.folderId == selectedFolder.id)
        .length;
    final confirmed = await showDeleteLibraryFolderDialog(
      context: context,
      folder: selectedFolder,
      quoteCount: quoteCount,
    );
    if (!confirmed) {
      return;
    }

    try {
      await widget.onDeleteFolder?.call(selectedFolder);
      if (mounted) {
        setState(() {
          _selectedFolderId = LibraryFolderViewIds.all;
        });
      }
    } on Object {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.libraryFolderDeleteFailure)));
    }
  }

  Future<void> _moveQuoteToFolder(LibraryQuote quote) async {
    final l10n = AppLocalizations.of(context);
    final result = await showLibraryFolderPickerSheet(
      context: context,
      folders: widget.folders,
      currentFolderId: quote.folderId,
    );
    if (result == null) {
      return;
    }

    try {
      await widget.onMoveQuoteToFolder?.call(quote, result.folderId);
    } on Object {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.libraryFolderMoveFailure)));
    }
  }

  Future<void> _toggleFavorite(LibraryQuote quote) async {
    final next = !quote.isFavorite;
    setState(() {
      _pendingFavoriteOverrides[quote.id] = next;
    });

    final onFavoriteChanged = widget.onFavoriteChanged;
    if (onFavoriteChanged == null) {
      return;
    }

    try {
      await onFavoriteChanged(quote, next);
    } on Object {
      if (!mounted) {
        return;
      }
    } finally {
      if (mounted) {
        setState(() {
          _pendingFavoriteOverrides.remove(quote.id);
        });
      }
    }
  }
}
