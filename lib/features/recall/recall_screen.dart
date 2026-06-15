import 'dart:async';

import 'package:bookcatch/features/quotes/models/saved_quote.dart';
import 'package:bookcatch/features/quotes/quote_share_message.dart';
import 'package:bookcatch/features/quotes/quote_source_formatter.dart';
import 'package:bookcatch/features/recall/data/reflection_entry_repository.dart';
import 'package:bookcatch/features/recall/models/reflection_entry.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_quote_mark.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'recall_widgets.dart';

class RecallScreen extends StatefulWidget {
  const RecallScreen({
    super.key,
    required this.quote,
    required this.repository,
    required this.onShareQuote,
  });

  final SavedQuote quote;
  final ReflectionEntryRepository repository;
  final Future<void> Function(String text, String title, Rect? origin)
  onShareQuote;

  @override
  State<RecallScreen> createState() => _RecallScreenState();
}

class _RecallScreenState extends State<RecallScreen> {
  final TextEditingController _questionOneController = TextEditingController();
  final TextEditingController _questionTwoController = TextEditingController();
  StreamSubscription<List<ReflectionEntry>>? _subscription;
  List<ReflectionEntry> _entries = const <ReflectionEntry>[];

  @override
  void initState() {
    super.initState();
    _subscription = widget.repository
        .watchEntriesForQuote(widget.quote.id)
        .listen(_replaceEntries);
    _refreshEntries();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _questionOneController.dispose();
    _questionTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          l10n.recallTitle,
          style: BookcatchTextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        key: const ValueKey('recall.scrollView'),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
        children: [
          _RecallQuoteCard(quote: widget.quote),
          const SizedBox(height: 28),
          _ReflectionQuestions(
            questionOneController: _questionOneController,
            questionTwoController: _questionTwoController,
          ),
          const SizedBox(height: 28),
          _PreviousRecords(entries: _entries),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                key: const ValueKey('recall.transcribeButton'),
                onPressed: _saveReflection,
                icon: const Icon(Icons.edit_note_outlined),
                label: Text(l10n.transcribeAction),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                key: const ValueKey('recall.shareButton'),
                onPressed: _shareQuote,
                icon: const Icon(Icons.share_outlined),
                label: Text(l10n.shareCardAction),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshEntries() async {
    _replaceEntries(
      await widget.repository.loadEntriesForQuote(widget.quote.id),
    );
  }

  void _replaceEntries(List<ReflectionEntry> entries) {
    if (!mounted) {
      return;
    }
    setState(() {
      _entries = entries;
    });
  }

  Future<void> _saveReflection() async {
    final l10n = AppLocalizations.of(context);
    try {
      await widget.repository.saveEntry(
        ReflectionEntryDraft(
          quoteId: widget.quote.id,
          questionOneAnswer: _questionOneController.text,
          questionTwoAnswer: _questionTwoController.text,
        ),
      );
    } on ReflectionEntryValidationException {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.recallEmptyReflectionMessage)),
        );
      }
      return;
    }
    _questionOneController.clear();
    _questionTwoController.clear();
    await _refreshEntries();
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.recallSavedMessage)));
    }
  }

  Future<void> _shareQuote() {
    final l10n = AppLocalizations.of(context);
    final text = buildQuoteShareMessage(
      l10n,
      quoteText: widget.quote.text,
      author: widget.quote.author,
      bookTitle: widget.quote.bookTitle,
      page: widget.quote.page,
    );
    return widget.onShareQuote(text, l10n.recallTitle, null);
  }
}
