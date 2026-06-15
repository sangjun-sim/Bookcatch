import 'package:bookcatch/features/notifications/models/quote_reminder_settings.dart';
import 'package:bookcatch/features/settings/models/reminder_settings.dart';
import 'package:bookcatch/features/settings/reminder_formatters.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

typedef QuoteReminderSettingsSaveCallback =
    Future<ReminderSettingsSaveResult> Function(QuoteReminderSettings settings);

Future<void> showQuoteReminderSettingsSheet({
  required BuildContext context,
  required QuoteReminderSettings initialSettings,
  required QuoteReminderSettingsSaveCallback onSave,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => QuoteReminderSettingsSheet(
      initialSettings: initialSettings,
      onSave: onSave,
    ),
  );
}

class QuoteReminderSettingsSheet extends StatefulWidget {
  const QuoteReminderSettingsSheet({
    super.key,
    required this.initialSettings,
    required this.onSave,
  });

  final QuoteReminderSettings initialSettings;
  final QuoteReminderSettingsSaveCallback onSave;

  @override
  State<QuoteReminderSettingsSheet> createState() =>
      _QuoteReminderSettingsSheetState();
}

class _QuoteReminderSettingsSheetState
    extends State<QuoteReminderSettingsSheet> {
  late QuoteReminderSettings _settings;
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
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 16, 20, bottomInset + 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHeader(title: l10n.quoteReminderSettingsTitle),
            Text(
              _settings.quotePreview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.quoteReminderEnableSwitch),
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
              title: Text(l10n.quoteReminderTimeLabel),
              trailing: Text(_formattedTime(context)),
              onTap: _pickTime,
            ),
            const SizedBox(height: 8),
            _SectionLabel(text: l10n.quoteReminderWeekdaysLabel),
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
            _SectionLabel(text: l10n.quoteReminderRepeatLabel),
            SegmentedButton<ReminderRepeatMode>(
              segments: [
                ButtonSegment(
                  value: ReminderRepeatMode.once,
                  label: Text(l10n.quoteReminderRepeatOnce),
                  icon: const Icon(Icons.looks_one_outlined),
                ),
                ButtonSegment(
                  value: ReminderRepeatMode.weekly,
                  label: Text(l10n.quoteReminderRepeatWeekly),
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
                l10n.quoteReminderRepeatOnceDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _isSaving ? null : _save,
                icon: const Icon(Icons.check_outlined),
                label: Text(l10n.quoteReminderSaveAction),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formattedTime(BuildContext context) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
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
      _showSnack(l10n.quoteReminderEmptyWeekdays);
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
          SnackBar(content: Text(l10n.quoteReminderSettingsSaved)),
        );
        return;
      case ReminderSettingsSaveResult.permissionDenied:
        _showSnack(l10n.quoteReminderPermissionDenied);
        return;
      case ReminderSettingsSaveResult.emptyWeekdays:
        _showSnack(l10n.quoteReminderEmptyWeekdays);
        return;
      case ReminderSettingsSaveResult.pendingLimitReached:
        _showSnack(l10n.quoteReminderPendingLimitReached);
        return;
      case ReminderSettingsSaveResult.scheduleFailed:
        _showSnack(l10n.quoteReminderScheduleFailed);
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
