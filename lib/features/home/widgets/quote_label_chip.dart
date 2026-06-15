import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class QuoteLabelChip extends StatelessWidget {
  const QuoteLabelChip({super.key, required this.labelId});

  final String labelId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = LabelCatalog.displayName(labelId, l10n);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.tertiaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          '#$label',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: BookcatchColors.onTertiaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
