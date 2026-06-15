import 'package:bookcatch/features/library/models/library_folder.dart';
import 'package:bookcatch/features/library/widgets/library_filter_chip.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class LibraryFolderBar extends StatelessWidget {
  const LibraryFolderBar({
    super.key,
    required this.folders,
    required this.selectedFolderId,
    required this.onFolderSelected,
    this.onCreateFolderPressed,
    this.onDeleteSelectedFolderPressed,
  });

  final List<LibraryFolder> folders;
  final String selectedFolderId;
  final ValueChanged<String> onFolderSelected;
  final VoidCallback? onCreateFolderPressed;
  final VoidCallback? onDeleteSelectedFolderPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedUserFolder = folders.any(
      (folder) => folder.id == selectedFolderId,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.libraryFoldersTitle,
              style: BookcatchTextStyles.labelMedium.copyWith(
                color: BookcatchColors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            if (selectedUserFolder && onDeleteSelectedFolderPressed != null)
              IconButton(
                tooltip: l10n.libraryFolderDeleteAction,
                onPressed: onDeleteSelectedFolderPressed,
                icon: const Icon(Icons.delete_outline),
              ),
            IconButton(
              tooltip: l10n.libraryCreateFolderAction,
              onPressed: onCreateFolderPressed,
              icon: const Icon(Icons.create_new_folder_outlined),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FolderChip(
                id: LibraryFolderViewIds.all,
                label: l10n.libraryFolderAll,
                selectedFolderId: selectedFolderId,
                onFolderSelected: onFolderSelected,
              ),
              _FolderChip(
                id: LibraryFolderViewIds.uncategorized,
                label: l10n.libraryFolderUncategorized,
                selectedFolderId: selectedFolderId,
                onFolderSelected: onFolderSelected,
              ),
              for (final folder in folders)
                _FolderChip(
                  id: folder.id,
                  label: folder.name,
                  selectedFolderId: selectedFolderId,
                  onFolderSelected: onFolderSelected,
                ),
              _FolderChip(
                id: LibraryFolderViewIds.favorites,
                label: l10n.libraryFilterFavorites,
                selectedFolderId: selectedFolderId,
                onFolderSelected: onFolderSelected,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FolderChip extends StatelessWidget {
  const _FolderChip({
    required this.id,
    required this.label,
    required this.selectedFolderId,
    required this.onFolderSelected,
  });

  final String id;
  final String label;
  final String selectedFolderId;
  final ValueChanged<String> onFolderSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: LibraryFilterChip(
        label: label,
        isSelected: id == selectedFolderId,
        onPressed: () => onFolderSelected(id),
      ),
    );
  }
}
