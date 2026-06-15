import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class HomeStatusBanner extends StatelessWidget {
  const HomeStatusBanner({
    super.key,
    required this.title,
    required this.body,
    required this.icon,
    this.onActionPressed,
    this.actionTooltip,
  });

  final String title;
  final String body;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String? actionTooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.surfaceContainerLow,
        border: Border.all(color: BookcatchColors.outlineVariant),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: BookcatchColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: BookcatchColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (onActionPressed == null)
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: BookcatchColors.surfaceContainer,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(icon, color: BookcatchColors.primary, size: 24),
                ),
              )
            else
              IconButton(
                tooltip: actionTooltip,
                onPressed: onActionPressed,
                icon: Icon(icon, color: BookcatchColors.primary),
              ),
          ],
        ),
      ),
    );
  }
}
