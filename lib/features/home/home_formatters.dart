import 'package:flutter/material.dart';
import 'package:bookcatch/l10n/app_localizations.dart';

abstract final class HomeFormatters {
  static String fullDate(BuildContext context, DateTime date) {
    final material = MaterialLocalizations.of(context);
    final l10n = AppLocalizations.of(context);
    return l10n.homeDateLabel(material.formatFullDate(date));
  }

  static String time(BuildContext context, DateTime date) {
    return MaterialLocalizations.of(
      context,
    ).formatTimeOfDay(TimeOfDay.fromDateTime(date));
  }

  static String savedAt(
    BuildContext context,
    DateTime savedAt,
    DateTime today,
  ) {
    final l10n = AppLocalizations.of(context);
    final savedDay = DateUtils.dateOnly(savedAt);
    final todayDay = DateUtils.dateOnly(today);
    final dayDelta = todayDay.difference(savedDay).inDays;

    if (dayDelta == 1) {
      return l10n.relativeYesterdayWithTime(time(context, savedAt));
    }
    if (dayDelta > 1) {
      return l10n.relativeDaysAgo(dayDelta);
    }
    return time(context, savedAt);
  }
}
