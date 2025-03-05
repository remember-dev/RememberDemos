import 'package:flutter/material.dart';

const int DEFAULT_SCHEDULE_DURATION_MINUTES = 60;

/// Round to the next closest 30 minutes
///
/// * ex: 10:48 -> 11:00
/// * ex: 8:31  -> 9:00
/// * ex: 8:00  -> 8:00
DateTime roundToNextHalfHour(DateTime dateTime) {
  int minute = dateTime.minute;
  if (minute == 0) return dateTime;
  int additionalMinutes =
      (minute > 0 && minute <= 30) ? 30 - minute : 60 - minute;
  return dateTime.add(Duration(minutes: additionalMinutes));
}

DateTime roundToClosestHalfHour(DateTime dateTime) {
  int minute = dateTime.minute;
  if (minute < 15) {
    return dateTime.copyWith(minute: 0);
  } else if (minute < 45) {
    return dateTime.copyWith(minute: 30);
  } else {
    return dateTime.add(const Duration(hours: 1)).copyWith(minute: 0);
  }
}

/// Return a DateTime object but with the hour and minute of [time].
DateTime mergeDateAndTime(DateTime date, TimeOfDay time) {
  return date.copyWith(hour: time.hour, minute: time.minute);
}
