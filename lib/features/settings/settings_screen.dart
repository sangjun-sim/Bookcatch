import 'package:bookcatch/features/settings/data/settings_default_data.dart';
import 'package:bookcatch/features/settings/models/settings_data.dart';
import 'package:bookcatch/features/settings/models/reminder_settings.dart';
import 'package:bookcatch/features/settings/widgets/reminder_settings_sheet.dart';
import 'package:bookcatch/features/settings/widgets/settings_group.dart';
import 'package:bookcatch/features/settings/widgets/settings_tile.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:bookcatch/theme/bookcatch_colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    this.data = defaultSettingsData,
    this.reminderSettings,
    this.availableReminderLabelIds = const <String>[],
    this.onSaveOriginalPhotosChanged,
    this.onReminderSettingsSave,
  });

  final SettingsData data;
  final UserReminderSettings? reminderSettings;
  final List<String> availableReminderLabelIds;
  final ValueChanged<bool>? onSaveOriginalPhotosChanged;
  final ReminderSettingsSaveCallback? onReminderSettingsSave;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 96),
      children: [
        SettingsGroup(
          title: l10n.settingsNotificationSection,
          children: [
            SettingsTile(
              icon: Icons.notifications_outlined,
              title: l10n.settingsNotificationSchedule,
              onTap: () => _openReminderSettings(context),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SettingsGroup(
          title: l10n.settingsDataSection,
          children: [
            SettingsTile.switchTile(
              icon: Icons.photo_library_outlined,
              title: l10n.settingsSaveOriginalPhotos,
              value: data.saveOriginalPhotos,
              onChanged: onSaveOriginalPhotosChanged ?? (_) {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        SettingsGroup(
          title: l10n.settingsInfoSection,
          children: [
            SettingsTile(
              icon: Icons.info_outline,
              title: l10n.settingsCopyrightGuide,
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.local_florist_outlined,
              title: l10n.settingsAppVersion,
              trailingText: data.appVersionLabel,
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          l10n.settingsFooter,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: BookcatchColors.outline),
        ),
      ],
    );
  }

  void _openReminderSettings(BuildContext context) {
    final settings = reminderSettings;
    final save = onReminderSettingsSave;
    if (settings == null || save == null) {
      return;
    }

    showReminderSettingsSheet(
      context: context,
      initialSettings: settings,
      availableLabelIds: availableReminderLabelIds,
      onSave: save,
    );
  }
}
