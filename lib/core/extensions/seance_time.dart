import 'package:planning_system/core/enums/seance.dart';

extension SeanceStartTime on SeanceEnum {
  String get startTime {
    final baseHour = 8;
    final baseMinute = 30;
    final minutesToAdd = index * 90;
    final totalMinutes = baseHour * 60 + baseMinute + minutesToAdd;
    final hour = totalMinutes ~/ 60;
    final minute = totalMinutes % 60;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}