import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class RecordLabelChip extends StatelessWidget {
  const RecordLabelChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onPressed(),
      labelStyle: BookcatchTextStyles.labelSmall.copyWith(
        color: isSelected
            ? BookcatchColors.onPrimaryContainer
            : BookcatchColors.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      ),
      selectedColor: BookcatchColors.primaryContainer,
      backgroundColor: BookcatchColors.surfaceVariant,
      side: BorderSide(
        color: isSelected
            ? BookcatchColors.primary
            : BookcatchColors.outlineVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
