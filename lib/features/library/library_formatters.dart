import 'package:flutter/material.dart';

abstract final class LibraryFormatters {
  static String recordedAt(BuildContext context, DateTime createdAt) {
    return MaterialLocalizations.of(context).formatMediumDate(createdAt);
  }

  static String reminderTime({
    required BuildContext context,
    required int hour,
    required int minute,
  }) {
    return MaterialLocalizations.of(
      context,
    ).formatTimeOfDay(TimeOfDay(hour: hour, minute: minute));
  }
}
