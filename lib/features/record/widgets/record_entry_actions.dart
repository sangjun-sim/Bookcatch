import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:bookcatch/widgets/bookcatch_text_styles.dart';
import 'package:flutter/material.dart';

class RecordEntryActions extends StatelessWidget {
  const RecordEntryActions({
    super.key,
    required this.onImportPhotoPressed,
    this.isImportingPhoto = false,
  });

  final VoidCallback onImportPhotoPressed;
  final bool isImportingPhoto;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: BookcatchColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: BookcatchColors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.recordIntroTitle,
              style: BookcatchTextStyles.headlineSmall.copyWith(
                color: BookcatchColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.recordIntroBody,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: BookcatchColors.textSecondary,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: OutlinedButton.icon(
                    onPressed: isImportingPhoto ? null : onImportPhotoPressed,
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: Text(
                      isImportingPhoto
                          ? l10n.recordImportPhotoInProgress
                          : l10n.recordImportPhotoAction,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
