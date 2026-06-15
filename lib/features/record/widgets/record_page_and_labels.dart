import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/record/widgets/record_field_label.dart';
import 'package:bookcatch/features/record/widgets/record_label_chip.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecordPageAndLabels extends StatelessWidget {
  const RecordPageAndLabels({
    super.key,
    required this.pageController,
    required this.labelIds,
    required this.selectedLabelIds,
    required this.onLabelPressed,
    required this.customLabelController,
    required this.onAddCustomLabelPressed,
  });

  final TextEditingController pageController;
  final List<String> labelIds;
  final Set<String> selectedLabelIds;
  final ValueChanged<String> onLabelPressed;
  final TextEditingController customLabelController;
  final VoidCallback onAddCustomLabelPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 520;
        final pageField = SizedBox(
          width: isWide ? 120 : double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecordFieldLabel(text: l10n.recordPageLabel),
              const SizedBox(height: 8),
              TextField(
                key: const ValueKey('record.pageField'),
                controller: pageController,
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: BookcatchColors.surfaceContainerLowest,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: BookcatchColors.outlineVariant,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: BookcatchColors.primary),
                  ),
                ),
              ),
            ],
          ),
        );
        final labels = _LabelSelector(
          labelIds: labelIds,
          selectedLabelIds: selectedLabelIds,
          customLabelController: customLabelController,
          onLabelPressed: onLabelPressed,
          onAddCustomLabelPressed: onAddCustomLabelPressed,
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageField,
              const SizedBox(width: 16),
              Expanded(child: labels),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [pageField, const SizedBox(height: 20), labels],
        );
      },
    );
  }
}

class _LabelSelector extends StatelessWidget {
  const _LabelSelector({
    required this.labelIds,
    required this.selectedLabelIds,
    required this.onLabelPressed,
    required this.customLabelController,
    required this.onAddCustomLabelPressed,
  });

  final List<String> labelIds;
  final Set<String> selectedLabelIds;
  final ValueChanged<String> onLabelPressed;
  final TextEditingController customLabelController;
  final VoidCallback onAddCustomLabelPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecordFieldLabel(text: l10n.recordEmotionLabel),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final labelId in labelIds)
              RecordLabelChip(
                label: LabelCatalog.displayName(labelId, l10n),
                isSelected: selectedLabelIds.contains(labelId),
                onPressed: () => onLabelPressed(labelId),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                key: const ValueKey('record.customEmotionField'),
                controller: customLabelController,
                onTapOutside: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: l10n.recordCustomEmotionPlaceholder,
                  filled: true,
                  fillColor: BookcatchColors.surfaceContainerLowest,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: BookcatchColors.outlineVariant,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: BookcatchColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filledTonal(
              tooltip: l10n.recordCustomEmotionAddAction,
              onPressed: onAddCustomLabelPressed,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
