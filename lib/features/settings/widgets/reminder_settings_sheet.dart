import 'package:bookcatch/features/labels/label_catalog.dart';
import 'package:bookcatch/features/settings/models/reminder_settings.dart';
import 'package:bookcatch/features/settings/reminder_formatters.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

typedef ReminderSettingsSaveCallback =
    Future<ReminderSettingsSaveResult> Function(UserReminderSettings settings);

Future<void> showReminderSettingsSheet({
  required BuildContext context,
  required UserReminderSettings initialSettings,
  required List<String> availableLabelIds,
  required ReminderSettingsSaveCallback onSave,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => ReminderSettingsSheet(
      initialSettings: initialSettings,
      availableLabelIds: availableLabelIds,
      onSave: onSave,
    ),
  );
}

class ReminderSettingsSheet extends StatefulWidget {
  const ReminderSettingsSheet({
    super.key,
    required this.initialSettings,
    required this.availableLabelIds,
    required this.onSave,
  });

  final UserReminderSettings initialSettings;
  final List<String> availableLabelIds;
  final ReminderSettingsSaveCallback onSave;

  @override
  State<ReminderSettingsSheet> createState() => _ReminderSettingsSheetState();
}

class _ReminderSettingsSheetState extends State<ReminderSettingsSheet> {
  late UserReminderSettings _settings;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _settings = widget.initialSettings;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, bottomInset + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHeader(title: l10n.reminderSettingsTitle),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.reminderEnableSwitch),
              value: _settings.isEnabled,
              onChanged: (value) {
                setState(() {
                  _settings = _settings.copyWith(isEnabled: value);
                });
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule_outlined),
              title: Text(l10n.reminderTimeLabel),
              trailing: Text(_formattedTime(context)),
              onTap: _pickTime,
            ),
            const SizedBox(height: 8),
            _SectionLabel(text: l10n.reminderWeekdaysLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final weekday in ReminderWeekday.values)
                  ChoiceChip(
                    label: Text(reminderWeekdayLabel(weekday, l10n)),
                    selected: _settings.weekdays.contains(weekday),
                    onSelected: (_) => _toggleWeekday(weekday),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            _SectionLabel(text: l10n.reminderRepeatLabel),
            SegmentedButton<ReminderRepeatMode>(
              segments: [
                ButtonSegment(
                  value: ReminderRepeatMode.once,
                  label: Text(l10n.reminderRepeatOnce),
                  icon: const Icon(Icons.looks_one_outlined),
                ),
                ButtonSegment(
                  value: ReminderRepeatMode.weekly,
                  label: Text(l10n.reminderRepeatWeekly),
                  icon: const Icon(Icons.repeat_outlined),
                ),
              ],
              selected: {_settings.repeatMode},
              onSelectionChanged: (selection) {
                setState(() {
                  _settings = _settings.copyWith(repeatMode: selection.single);
                });
              },
            ),
            if (_settings.repeatMode == ReminderRepeatMode.once) ...[
              const SizedBox(height: 8),
              Text(
                l10n.reminderRepeatOnceDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: _settings.selectedLabelId ?? '',
              decoration: InputDecoration(
                labelText: l10n.reminderLabelRuleLabel,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: '', child: Text(l10n.reminderLabelAll)),
                for (final labelId in widget.availableLabelIds)
                  DropdownMenuItem(
                    value: labelId,
                    child: Text(LabelCatalog.displayName(labelId, l10n)),
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  _settings = value == null || value.isEmpty
                      ? _settings.copyWith(clearSelectedLabelId: true)
                      : _settings.copyWith(selectedLabelId: value);
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _isSaving ? null : _save,
                icon: const Icon(Icons.check_outlined),
                label: Text(l10n.reminderSaveAction),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formattedTime(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(
      TimeOfDay(hour: _settings.hour, minute: _settings.minute),
    );
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _settings.hour, minute: _settings.minute),
    );
    if (picked == null || !mounted) {
      return;
    }
    setState(() {
      _settings = _settings.copyWith(hour: picked.hour, minute: picked.minute);
    });
  }

  void _toggleWeekday(ReminderWeekday weekday) {
    final weekdays = Set<ReminderWeekday>.of(_settings.weekdays);
    if (!weekdays.remove(weekday)) {
      weekdays.add(weekday);
    }
    setState(() {
      _settings = _settings.copyWith(weekdays: weekdays);
    });
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    if (_settings.weekdays.isEmpty) {
      _showSnack(l10n.reminderEmptyWeekdays);
      return;
    }

    setState(() {
      _isSaving = true;
    });
    final result = await widget.onSave(_settings);
    if (!mounted) {
      return;
    }
    setState(() {
      _isSaving = false;
    });

    switch (result) {
      case ReminderSettingsSaveResult.saved:
        final messenger = ScaffoldMessenger.of(context);
        Navigator.of(context).pop();
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.reminderSettingsSaved)),
        );
        return;
      case ReminderSettingsSaveResult.permissionDenied:
        _showSnack(l10n.reminderPermissionDenied);
        return;
      case ReminderSettingsSaveResult.emptyWeekdays:
        _showSnack(l10n.reminderEmptyWeekdays);
        return;
      case ReminderSettingsSaveResult.pendingLimitReached:
        _showSnack(l10n.quoteReminderPendingLimitReached);
        return;
      case ReminderSettingsSaveResult.scheduleFailed:
        _showSnack(l10n.reminderScheduleFailed);
        return;
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _SheetHeader extends StatelessWidget {
  const _SheetHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        IconButton(
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
