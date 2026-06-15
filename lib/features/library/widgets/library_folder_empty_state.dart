import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class LibraryFolderEmptyState extends StatelessWidget {
  const LibraryFolderEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 12),
      child: Column(
        children: [
          const Icon(
            Icons.folder_open_outlined,
            size: 56,
            color: BookcatchColors.outline,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.libraryFolderEmptyTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: BookcatchColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.libraryFolderEmptyBody,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: BookcatchColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
