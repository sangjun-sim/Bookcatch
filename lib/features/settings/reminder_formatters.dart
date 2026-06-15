import 'package:bookcatch/features/home/home_formatters.dart';
import 'package:bookcatch/features/settings/models/reminder_settings.dart';
import 'package:bookcatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String reminderWeekdayLabel(ReminderWeekday weekday, AppLocalizations l10n) {
  return switch (weekday) {
    ReminderWeekday.monday => l10n.weekdayMonday,
    ReminderWeekday.tuesday => l10n.weekdayTuesday,
    ReminderWeekday.wednesday => l10n.weekdayWednesday,
    ReminderWeekday.thursday => l10n.weekdayThursday,
    ReminderWeekday.friday => l10n.weekdayFriday,
    ReminderWeekday.saturday => l10n.weekdaySaturday,
    ReminderWeekday.sunday => l10n.weekdaySunday,
  };
}

String reminderOccurrenceLabel({
  required BuildContext context,
  required DateTime scheduledAt,
  required DateTime now,
}) {
  final l10n = AppLocalizations.of(context);
  final time = HomeFormatters.time(context, scheduledAt);
  final days = _dateOnly(scheduledAt).difference(_dateOnly(now)).inDays;
  if (days == 0) {
    return l10n.reminderOccurrenceToday(time);
  }
  if (days == 1) {
    return l10n.reminderOccurrenceTomorrow(time);
  }
  return l10n.reminderOccurrenceThisWeek(
    reminderWeekdayLabel(_weekdayFromDateTime(scheduledAt), l10n),
    time,
  );
}

DateTime _dateOnly(DateTime value) {
  return DateTime(value.year, value.month, value.day);
}

ReminderWeekday _weekdayFromDateTime(DateTime value) {
  return ReminderWeekday.values.firstWhere(
    (weekday) => weekday.isoValue == value.weekday,
  );
}
