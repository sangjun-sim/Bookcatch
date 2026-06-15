import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/quotes/models/saved_quote.dart';
import 'package:bookcatch/features/record/record_label_options.dart';
import 'package:bookcatch/features/record/widgets/record_field_label.dart';
import 'package:bookcatch/features/record/widgets/record_page_and_labels.dart';
import 'package:bookcatch/features/record/widgets/record_text_input.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class LibraryQuoteEditScreen extends StatefulWidget {
  const LibraryQuoteEditScreen({
    super.key,
    required this.quote,
    required this.onSave,
  });

  final SavedQuote quote;
  final Future<void> Function(SavedQuote quote) onSave;

  @override
  State<LibraryQuoteEditScreen> createState() => _LibraryQuoteEditScreenState();
}

class _LibraryQuoteEditScreenState extends State<LibraryQuoteEditScreen> {
  late final TextEditingController _bookController;
  late final TextEditingController _authorController;
  late final TextEditingController _quoteController;
  late final TextEditingController _pageController;
  late final TextEditingController _memoController;
  late final TextEditingController _customLabelController;
  late final List<String> _customLabelIds;
  late final Set<String> _selectedLabelIds;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _bookController = TextEditingController(text: widget.quote.bookTitle);
    _authorController = TextEditingController(text: widget.quote.author);
    _quoteController = TextEditingController(text: widget.quote.text);
    _pageController = TextEditingController(text: widget.quote.page);
    _memoController = TextEditingController(text: widget.quote.memo);
    _customLabelController = TextEditingController();
    _customLabelIds = widget.quote.labelIds
        .where((labelId) => labelId.startsWith('custom.'))
        .toList();
    _selectedLabelIds = widget.quote.labelIds.toSet();
  }

  @override
  void dispose() {
    _bookController.dispose();
    _authorController.dispose();
    _quoteController.dispose();
    _pageController.dispose();
    _memoController.dispose();
    _customLabelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.libraryQuoteEditTitle)),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          RecordFieldLabel(text: l10n.recordBookQuestion),
          const SizedBox(height: 8),
          RecordTextInput(
            key: const ValueKey('library.edit.bookField'),
            controller: _bookController,
            onTapOutside: _unfocusPrimary,
            textInputAction: TextInputAction.next,
            hintText: l10n.recordBookPlaceholder,
            prefixIcon: const Icon(Icons.search),
          ),
          const SizedBox(height: 16),
          RecordFieldLabel(text: l10n.recordAuthorLabel),
          const SizedBox(height: 8),
          RecordTextInput(
            key: const ValueKey('library.edit.authorField'),
            controller: _authorController,
            onTapOutside: _unfocusPrimary,
            textInputAction: TextInputAction.next,
            hintText: l10n.recordAuthorPlaceholder,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 20),
          RecordFieldLabel(text: l10n.recordEditQuoteLabel),
          const SizedBox(height: 8),
          RecordTextInput(
            key: const ValueKey('library.edit.quoteField'),
            controller: _quoteController,
            onTapOutside: _unfocusPrimary,
            hintText: l10n.recordQuotePlaceholder,
            minLines: 4,
            maxLines: 6,
          ),
          const SizedBox(height: 20),
          RecordPageAndLabels(
            pageController: _pageController,
            labelIds: _visibleLabelIds,
            selectedLabelIds: _selectedLabelIds,
            onLabelPressed: _toggleLabel,
            customLabelController: _customLabelController,
            onAddCustomLabelPressed: _addCustomLabel,
          ),
          const SizedBox(height: 20),
          RecordFieldLabel(text: l10n.recordMemoLabel),
          const SizedBox(height: 8),
          RecordTextInput(
            key: const ValueKey('library.edit.memoField'),
            controller: _memoController,
            onTapOutside: _unfocusPrimary,
            hintText: l10n.recordMemoPlaceholder,
            minLines: 3,
            maxLines: 5,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _isSaving ? null : _save,
              icon: const Icon(Icons.save_outlined),
              label: Text(
                _isSaving
                    ? l10n.libraryQuoteEditInProgress
                    : l10n.libraryQuoteEditConfirm,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.libraryQuoteEditHelper,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: BookcatchColors.outline),
          ),
        ],
      ),
    );
  }

  List<String> get _visibleLabelIds => [
    ...recordAvailableLabelIds,
    ..._customLabelIds,
  ];

  void _toggleLabel(String labelId) {
    setState(() {
      if (!_selectedLabelIds.add(labelId)) {
        _selectedLabelIds.remove(labelId);
      }
    });
  }

  void _addCustomLabel() {
    final l10n = AppLocalizations.of(context);
    final label = _customLabelController.text.trim();
    if (label.isEmpty) {
      return;
    }

    final isDuplicate = _visibleLabelIds.any(
      (labelId) => LabelCatalog.displayName(labelId, l10n) == label,
    );
    if (isDuplicate) {
      _showSnack(l10n.recordCustomEmotionDuplicate);
      return;
    }

    final labelId = 'custom.$label';
    setState(() {
      _customLabelIds.add(labelId);
      _selectedLabelIds.add(labelId);
      _customLabelController.clear();
    });
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    if (_quoteController.text.trim().isEmpty) {
      _showSnack(l10n.recordSaveValidationEmptyQuote);
      return;
    }

    setState(() {
      _isSaving = true;
    });
    try {
      await widget.onSave(
        widget.quote.copyWith(
          text: _quoteController.text.trim(),
          bookTitle: _bookController.text.trim(),
          author: _authorController.text.trim(),
          page: _pageController.text.trim(),
          memo: _memoController.text.trim(),
          labelIds: _selectedLabelIds.toList(growable: false),
        ),
      );
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } on Object {
      if (mounted) {
        _showSnack(l10n.libraryQuoteEditFailure);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _unfocusPrimary(PointerDownEvent event) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
