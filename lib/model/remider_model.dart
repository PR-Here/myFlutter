import 'package:hive_flutter/hive_flutter.dart';
part 'remider_model.g.dart';

@HiveType(typeId: 0)
class ReminderModel extends HiveObject {
  ReminderModel({
    required this.pickedTimeHour,
    required this.pickedTimeMinute,
    required this.isReminderEnable,
    required this.createdTimeMilliseconds,
  });

  @HiveField(0)
  int pickedTimeHour;
  @HiveField(1)
  int pickedTimeMinute;
  @HiveField(2)
  bool isReminderEnable;
  @HiveField(3)
  int createdTimeMilliseconds;
}
