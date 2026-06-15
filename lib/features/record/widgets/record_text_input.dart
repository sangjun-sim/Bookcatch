import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class RecordTextInput extends StatelessWidget {
  const RecordTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.onTapOutside,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final int minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TapRegionCallback? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: onTapOutside,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: textAlign,
      style: BookcatchTextStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: BookcatchColors.surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: BookcatchColors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: BookcatchColors.primary),
        ),
      ),
    );
  }
}
