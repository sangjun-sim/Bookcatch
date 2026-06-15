import 'package:bookcatch/features/library/models/library_folder.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LibraryFolderPickResult {
  const LibraryFolderPickResult(this.folderId);

  final String? folderId;
}

Future<String?> showCreateLibraryFolderDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (context) => const _CreateLibraryFolderDialog(),
  );
}

class _CreateLibraryFolderDialog extends StatefulWidget {
  const _CreateLibraryFolderDialog();

  @override
  State<_CreateLibraryFolderDialog> createState() =>
      _CreateLibraryFolderDialogState();
}

class _CreateLibraryFolderDialogState
    extends State<_CreateLibraryFolderDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(l10n.libraryCreateFolderTitle),
      content: TextField(
        autofocus: true,
        controller: _controller,
        decoration: InputDecoration(
          labelText: l10n.libraryFolderNameLabel,
          hintText: l10n.libraryFolderNameHint,
        ),
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submitFolderName(context, _controller),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancelAction),
        ),
        FilledButton(
          onPressed: () => _submitFolderName(context, _controller),
          child: Text(l10n.libraryFolderCreateConfirm),
        ),
      ],
    );
  }
}

Future<LibraryFolderPickResult?> showLibraryFolderPickerSheet({
  required BuildContext context,
  required List<LibraryFolder> folders,
  required String? currentFolderId,
}) {
  final l10n = AppLocalizations.of(context);

  return showModalBottomSheet<LibraryFolderPickResult>(
    context: context,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        children: [
          ListTile(
            title: Text(l10n.libraryMoveToFolderTitle),
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            leading: Icon(
              currentFolderId == null
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
            ),
            title: Text(l10n.libraryFolderUncategorized),
            onTap: () =>
                Navigator.of(context).pop(const LibraryFolderPickResult(null)),
          ),
          for (final folder in folders)
            ListTile(
              leading: Icon(
                currentFolderId == folder.id
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
              ),
              title: Text(folder.name),
              onTap: () =>
                  Navigator.of(context).pop(LibraryFolderPickResult(folder.id)),
            ),
        ],
      ),
    ),
  );
}

Future<bool> showDeleteLibraryFolderDialog({
  required BuildContext context,
  required LibraryFolder folder,
  required int quoteCount,
}) async {
  final l10n = AppLocalizations.of(context);
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.libraryFolderDeleteTitle),
      content: Text(l10n.libraryFolderDeleteMessage(folder.name, quoteCount)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.cancelAction),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.libraryFolderDeleteConfirm),
        ),
      ],
    ),
  );
  return confirmed == true;
}

void _submitFolderName(BuildContext context, TextEditingController controller) {
  final name = controller.text.trim();
  if (name.isEmpty) {
    return;
  }
  Navigator.of(context).pop(name);
}
