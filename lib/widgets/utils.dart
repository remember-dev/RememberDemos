import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/theme.dart';

Color hexToColor(String? code) {
  if (code?.length != 6) return RememberColors.regular;
  final color = int.tryParse(code ?? '', radix: 16);
  return (color == null || color < 0)
      ? RememberColors.regular
      : Color(0xFF000000 + color);
}

/// It is guarantted that all strings returned from here can be passed to
/// [hexToColor] and return the correct colors.
String colorToHex(Color color) {
  return "${(color.r * 0xFF).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}"
      "${(color.g * 0xFF).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}"
      "${(color.b * 0xFF).toInt().toRadixString(16).padLeft(2, '0').toUpperCase()}";
}

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

/// Hides the keyboard if possible.
void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

//////////////////// RANDOM GENERATORS ////////////////////
Random rand = Random();

const List _verbs = [
  // format
  "Run", "Jump", "Write", "Read", "Sing", "Dance", "Build", "Create",
  "Paint", "Draw", "Cook", "Clean", "Fix", "Break", "Open", "Close", "Lift",
  "Throw", "Catch", "Push", "Pull", "Turn", "Cut", "Tie", "Untie", "Shake",
  "Move", "Stop", "Start", "Watch", "Listen", "Speak", "Shout", "Whisper",
  "Laugh", "Cry", "Think", "Dream", "Plan", "Organize", "Arrange", "Buy",
  "Sell", "Give", "Take", "Find", "Lose", "Share",
  "Steal", "Borrow", "Return", "Measure",
];
const List _nouns = [
  // format
  "Apple", "Table", "Chair", "Mountain", "River", "Ocean", "Tree", "House",
  "Car", "Bicycle", "Window", "Door", "Book", "Pen", "Laptop", "Phone",
  "Garden", "Bridge", "Road", "Sky", "Cloud",
  "Sun", "Moon", "Star", "Lamp", "Candle", "Clock", "Mirror", "Bottle",
  "Cup", "Plate", "Fork", "Spoon", "Bed", "Pillow", "Blanket", "Shoe", "Hat",
  "Shirt", "Pants", "Wallet", "Key", "Backpack", "Camera", "Painting", "Statue",
  "Fence", "Doorbell", "Mailbox", "Ball", "Toy",
];
const List _adverbs = [
  // this is to format the adverbs
  "Quickly", "Slowly", "Quietly", "Loudly", "Carefully", "Carelessly",
  "Eagerly", "Reluctantly", "Gracefully", "Clumsily", "Happily", "Sadly",
  "Angrily", "Gently", "Roughly", "Easily", "Hardly", "Cheerfully", "Miserably",
  "Boldly", "Timidly", "Bravely", "Cautiously", "Excitedly", "Calmly",
  "Energetically", "Wearily", "Patiently", "Impatiently", "Generously",
  "Selfishly", "Kindly", "Rudely", "Politely", "Foolishly", "Wisely", "Sharply",
  "Smoothly", "Rapidly", "Gradually", "Honestly", "Dishonestly", "Anxiously",
  "Confidently", "Awkwardly", "Neatly", "Messily", "Fiercely", "Softly",
  "Firmly", "Weakly",
];

const taskColors = [
  Color(0xFF73C0FF), // 0
  Color(0xFFFF9EC3), // 1
  Color(0xFF92EA92), // 2
  Color(0xFF90FCEA), // 3
  Color(0xFFFFC400), // 4
  Color(0xFFFFF466), // 5
  Color(0xFFE7D79C), // 6
  Color(0xFFBCA2ED), // 7
  Color(0xFFDADADA), // 8
];

String get randomTitle =>
    "${_verbs.elementAt(rand.nextInt(_verbs.length))} ${_nouns.elementAt(rand.nextInt(_nouns.length))} ${_adverbs.elementAt(rand.nextInt(_adverbs.length))}";

Color get randomTaskColor => taskColors[rand.nextInt(taskColors.length)];

BasicTask randomBasicTask({
  String? taskTitle,
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
  Color? color,
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
    taskTitle: taskTitle ?? randomTitle,
    completed: completed ?? rand.nextBool(),
    archived: archived ?? rand.nextBool(),
    isDeleted: isDeleted ?? false,
    isGoalTask: false,
    isDelegatedTask: isDelegated ?? false,
    color: color ?? randomTaskColor,
    priority: priority ?? rand.nextInt(3),
    orderGroup: rand.nextInt(10),
    goalId: goalId,
    taskType: taskType ?? rand.nextInt(3),
    recurranceType: recurranceType,
    parentTask: parentTask,
  );
}
