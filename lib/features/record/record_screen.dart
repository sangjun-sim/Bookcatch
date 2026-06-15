import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/quotes/data/quote_repository.dart';
import 'package:bookcatch/features/record/data/record_initial_data.dart';
import 'package:bookcatch/features/record/models/record_draft.dart';
import 'package:bookcatch/features/record/record_label_options.dart';
import 'package:bookcatch/features/record/record_photo_crop_screen.dart';
import 'package:bookcatch/features/record/record_photo_importer.dart';
import 'package:bookcatch/features/record/record_save_message.dart';
import 'package:bookcatch/features/record/widgets/record_entry_actions.dart';
import 'package:bookcatch/features/record/widgets/record_empty_state.dart';
import 'package:bookcatch/features/record/widgets/record_field_label.dart';
import 'package:bookcatch/features/record/widgets/record_page_and_labels.dart';
import 'package:bookcatch/features/record/widgets/record_text_input.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

part 'record_screen_photo_import.dart';
part 'record_screen_save.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({
    super.key,
    this.initialDraft = initialRecordDraft,
    this.startsEmpty = false,
    this.quoteRepository,
    this.photoImporter,
    this.saveOriginalPhotos = true,
  });

  final RecordDraft initialDraft;
  final bool startsEmpty;
  final QuoteRepository? quoteRepository;
  final RecordPhotoImporter? photoImporter;
  final bool saveOriginalPhotos;

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late final TextEditingController _bookController;
  late final TextEditingController _authorController;
  late final TextEditingController _quoteController;
  late final TextEditingController _pageController;
  late final TextEditingController _memoController;
  late final TextEditingController _customLabelController;
  late final List<String> _customLabelIds;
  late final Set<String> _selectedLabelIds;
  late final RecordDraft _formDraft;
  late bool _isComposing;
  bool _isSaving = false;
  bool _isImportingPhoto = false;

  @override
  void initState() {
    super.initState();
    _isComposing = !widget.startsEmpty;
    _formDraft = widget.startsEmpty ? initialRecordDraft : widget.initialDraft;
    _bookController = TextEditingController(text: _formDraft.bookTitle);
    _authorController = TextEditingController(text: _formDraft.author);
    _quoteController = TextEditingController(text: _formDraft.quoteText);
    _pageController = TextEditingController(text: _formDraft.page);
    _memoController = TextEditingController(text: _formDraft.memo);
    _customLabelController = TextEditingController();
    _customLabelIds = _formDraft.labelIds
        .where((labelId) => labelId.startsWith('custom.'))
        .toList();
    _selectedLabelIds = _formDraft.labelIds.toSet();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _recoverLostPhotoImport();
    });
  }

  @override
  void didUpdateWidget(covariant RecordScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startsEmpty && !widget.startsEmpty && !_isComposing) {
      _isComposing = true;
    }
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

  void _updateState(VoidCallback update) {
    setState(update);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (!_isComposing) {
      return RecordEmptyState(onStartRecordingPressed: _startRecording);
    }

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
      children: [
        RecordEntryActions(
          onImportPhotoPressed: _importPhoto,
          isImportingPhoto: _isImportingPhoto,
        ),
        const SizedBox(height: 24),
        RecordFieldLabel(text: l10n.recordBookQuestion),
        const SizedBox(height: 8),
        RecordTextInput(
          key: const ValueKey('record.bookField'),
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
          key: const ValueKey('record.authorField'),
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
          key: const ValueKey('record.quoteField'),
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
          key: const ValueKey('record.memoField'),
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
            onPressed: _isSaving ? null : _saveDraft,
            icon: const Icon(Icons.save_outlined),
            label: Text(
              _isSaving ? l10n.recordSaveInProgress : l10n.recordSaveAction,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          l10n.recordSaveHelper,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: BookcatchColors.outline),
        ),
      ],
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

  void _startRecording() {
    setState(() {
      _isComposing = true;
    });
  }

  void _unfocusPrimary(PointerDownEvent event) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
