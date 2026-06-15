part of 'recall_screen.dart';

class _RecallQuoteCard extends StatelessWidget {
  const _RecallQuoteCard({required this.quote});

  final SavedQuote quote;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final source = formatQuoteSource(
      l10n,
      author: quote.author,
      bookTitle: quote.bookTitle,
      page: quote.page,
    );
    return Material(
      color: BookcatchColors.surfaceContainerLowest,
      elevation: 3,
      shadowColor: BookcatchColors.primary.withValues(alpha: 0.08),
      surfaceTintColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookcatchQuoteMark(
              size: 42,
              color: BookcatchColors.secondary.withValues(alpha: 0.28),
            ),
            const SizedBox(height: 12),
            Text(
              '"${quote.text}"',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: BookcatchColors.primary,
                fontStyle: FontStyle.italic,
                height: 1.42,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: BookcatchColors.outlineVariant),
            const SizedBox(height: 10),
            Text(
              source,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: BookcatchColors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              l10n.recallRecordedAt(_dateLabel(context, quote.createdAt)),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: BookcatchColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReflectionQuestions extends StatelessWidget {
  const _ReflectionQuestions({
    required this.questionOneController,
    required this.questionTwoController,
  });

  final TextEditingController questionOneController;
  final TextEditingController questionTwoController;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recallTodayReflectionTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        _QuestionField(
          keyName: 'recall.questionOneField',
          label: l10n.recallQuestionOneLabel,
          prompt: l10n.recallQuestionOnePrompt,
          hint: l10n.recallQuestionOneHint,
          controller: questionOneController,
        ),
        const SizedBox(height: 12),
        _QuestionField(
          keyName: 'recall.questionTwoField',
          label: l10n.recallQuestionTwoLabel,
          prompt: l10n.recallQuestionTwoPrompt,
          hint: l10n.recallQuestionTwoHint,
          controller: questionTwoController,
        ),
      ],
    );
  }
}

class _QuestionField extends StatelessWidget {
  const _QuestionField({
    required this.keyName,
    required this.label,
    required this.prompt,
    required this.hint,
    required this.controller,
  });

  final String keyName;
  final String label;
  final String prompt;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.surfaceContainerLow,
        border: Border.all(color: BookcatchColors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: BookcatchColors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(prompt, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            TextField(
              key: ValueKey(keyName),
              controller: controller,
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              minLines: 2,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(hintText: hint),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousRecords extends StatelessWidget {
  const _PreviousRecords({required this.entries});

  final List<ReflectionEntry> entries;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.recallPreviousRecordsTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Icon(Icons.history, color: BookcatchColors.secondary),
          ],
        ),
        const SizedBox(height: 14),
        if (entries.isEmpty)
          Text(
            l10n.recallEmptyHistory,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: BookcatchColors.onSurfaceVariant,
            ),
          )
        else
          Stack(
            children: [
              const Positioned(
                left: 11,
                top: 14,
                bottom: 14,
                child: VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: BookcatchColors.outlineVariant,
                ),
              ),
              Column(
                children: [
                  for (final entry in entries) _HistoryItem(entry: entry),
                ],
              ),
            ],
          ),
      ],
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.entry});

  final ReflectionEntry entry;

  @override
  Widget build(BuildContext context) {
    final answers = [
      if (entry.questionOneAnswer.isNotEmpty) entry.questionOneAnswer,
      if (entry.questionTwoAnswer.isNotEmpty) entry.questionTwoAnswer,
    ].join('\n\n');
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: BookcatchColors.surfaceContainer,
              border: Border.all(
                color: BookcatchColors.tertiaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: BookcatchColors.surfaceContainerLowest,
                border: Border.all(color: BookcatchColors.outlineVariant),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _dateLabel(context, entry.createdAt),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: BookcatchColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      answers,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: BookcatchColors.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _dateLabel(BuildContext context, DateTime date) {
  final l10n = AppLocalizations.of(context);
  final now = DateTime.now();
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return l10n.recallRecordedNow;
  }
  return DateFormat.yMMMd(
    Localizations.localeOf(context).toLanguageTag(),
  ).format(date);
}
