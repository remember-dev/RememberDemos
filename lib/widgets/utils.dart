import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/basic_task.dart';

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

//////////////////// RANDOM GENERATORS ////////////////////
const List _verbs = [
  "Run",
  "Jump",
  "Write",
  "Read",
  "Sing",
  "Dance",
  "Build",
  "Create",
  "Paint",
  "Draw",
  "Cook",
  "Clean",
  "Fix",
  "Break",
  "Open",
  "Close",
  "Lift",
  "Throw",
  "Catch",
  "Push",
  "Pull",
  "Turn",
  "Cut",
  "Tie",
  "Untie",
  "Shake",
  "Move",
  "Stop",
  "Start",
  "Watch",
  "Listen",
  "Speak",
  "Shout",
  "Whisper",
  "Laugh",
  "Cry",
  "Think",
  "Dream",
  "Plan",
  "Organize",
  "Arrange",
  "Buy",
  "Sell",
  "Give",
  "Take",
  "Find",
  "Lose",
  "Share",
  "Steal",
  "Borrow",
  "Return",
  "Measure",
];
const List _adverbs = [
  "Quickly",
  "Slowly",
  "Quietly",
  "Loudly",
  "Carefully",
  "Carelessly",
  "Eagerly",
  "Reluctantly",
  "Gracefully",
  "Clumsily",
  "Happily",
  "Sadly",
  "Angrily",
  "Gently",
  "Roughly",
  "Easily",
  "Hardly",
  "Cheerfully",
  "Miserably",
  "Boldly",
  "Timidly",
  "Bravely",
  "Cautiously",
  "Excitedly",
  "Calmly",
  "Energetically",
  "Wearily",
  "Patiently",
  "Impatiently",
  "Generously",
  "Selfishly",
  "Kindly",
  "Rudely",
  "Politely",
  "Foolishly",
  "Wisely",
  "Sharply",
  "Smoothly",
  "Rapidly",
  "Gradually",
  "Honestly",
  "Dishonestly",
  "Anxiously",
  "Confidently",
  "Awkwardly",
  "Neatly",
  "Messily",
  "Fiercely",
  "Softly",
  "Firmly",
  "Weakly",
];

String _getRandomTitle(Random rand) {
  return "${_verbs.elementAt(rand.nextInt(_verbs.length))} ${_adverbs.elementAt(rand.nextInt(_adverbs.length))}";
}

BasicTask randomBasicTask({
  bool? completed,
  Guid? userId,
  Guid? goalId,
  bool? isDelegated,
  int? priority,
  int? taskType,
  bool? archived,
  bool? isDeleted,
  String? recurranceType,
  Guid? parentTask,
  DateTime? scheduledTime,
}) {
  var rand = Random();
  var id = Guid.newGuid;
  return BasicTask(
    id: id,
    lastModified: DateTime.timestamp(),
    userId: userId ?? Guid.newGuid,
    // Random time from now to three days from now
    scheduledTime: scheduledTime ??
        DateTime.now()
            .copyWith(hour: 0, minute: 0, second: 0)
            .add(Duration(minutes: rand.nextInt(1440))),
    taskTitle: _getRandomTitle(rand),
    completed: completed ?? rand.nextBool(),
    archived: archived ?? rand.nextBool(),
    isDeleted: isDeleted ?? false,
    isGoalTask: false,
    isDelegatedTask: isDelegated ?? false,
    color: Color.fromARGB(
        0xFF, rand.nextInt(0xFF), rand.nextInt(0xFF), rand.nextInt(0xFF)),
    priority: priority ?? rand.nextInt(3),
    orderGroup: rand.nextInt(10),
    goalId: goalId,
    taskType: taskType ?? rand.nextInt(3),
    recurranceType: recurranceType,
    parentTask: parentTask,
  );
}
