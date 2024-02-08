
import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 1)
class AlarmModel{
  @HiveField(0)
  int hour;
  @HiveField(1)
  int minute;
  @HiveField(2)
  String period;

  AlarmModel(
  {
    required this.hour, required this.minute, required this.period
}
      );
}