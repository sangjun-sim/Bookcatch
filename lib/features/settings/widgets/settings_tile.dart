import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  static const double height = 56;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailingText,
    this.isDestructive = false,
  }) : switchValue = null,
       onSwitchChanged = null;

  const SettingsTile.switchTile({
    super.key,
    required this.icon,
    required this.title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) : onTap = null,
       trailingText = null,
       isDestructive = false,
       switchValue = value,
       onSwitchChanged = onChanged;

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final String? trailingText;
  final bool isDestructive;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    final foreground = isDestructive
        ? Theme.of(context).colorScheme.error
        : BookcatchColors.onSurface;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDestructive ? foreground : BookcatchColors.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BookcatchTextStyles.labelMedium.copyWith(
                    color: foreground,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _Trailing(
                text: trailingText,
                switchValue: switchValue,
                onSwitchChanged: onSwitchChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing({this.text, this.switchValue, this.onSwitchChanged});

  final String? text;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    if (switchValue != null && onSwitchChanged != null) {
      return Switch.adaptive(value: switchValue!, onChanged: onSwitchChanged);
    }
    if (text != null) {
      return Text(
        text!,
        style: BookcatchTextStyles.caption.copyWith(
          color: BookcatchColors.outline,
        ),
      );
    }
    return const Icon(Icons.chevron_right, color: BookcatchColors.outline);
  }
}
