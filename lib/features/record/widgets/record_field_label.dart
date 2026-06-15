import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class RecordFieldLabel extends StatelessWidget {
  const RecordFieldLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: BookcatchTextStyles.labelMedium.copyWith(
        color: BookcatchColors.textSecondary,
      ),
    );
  }
}
