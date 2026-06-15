import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: BookcatchTextStyles.labelSmall.copyWith(
              color: BookcatchColors.outline,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Material(
          color: BookcatchColors.surfaceContainerLowest,
          elevation: 1,
          shadowColor: BookcatchColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          surfaceTintColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(children: _withDividers(children)),
          ),
        ),
      ],
    );
  }

  List<Widget> _withDividers(List<Widget> children) {
    final result = <Widget>[];
    for (var index = 0; index < children.length; index += 1) {
      if (index > 0) {
        result.add(
          const Divider(
            height: 1,
            indent: 56,
            color: BookcatchColors.outlineVariant,
          ),
        );
      }
      result.add(children[index]);
    }
    return result;
  }
}
