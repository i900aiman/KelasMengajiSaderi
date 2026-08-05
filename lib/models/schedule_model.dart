import 'package:flutter/material.dart';

enum ScheduleStatus { tersedia, hampirPenuh, penuh }

extension ScheduleStatusX on ScheduleStatus {
  String get label {
    switch (this) {
      case ScheduleStatus.tersedia:
        return 'Tersedia';
      case ScheduleStatus.hampirPenuh:
        return 'Hampir Penuh';
      case ScheduleStatus.penuh:
        return 'Penuh';
    }
  }
}

/// Model untuk satu slot kelas pada hari tertentu (halaman Jadual).
class ScheduleModel {
  final String id;
  final String programId;
  final String title;
  final IconData icon;
  final Color iconBackground;
  final String teacher;
  final String location;
  final String time;
  final DateTime date;
  final ScheduleStatus status;

  const ScheduleModel({
    required this.id,
    required this.programId,
    required this.title,
    required this.icon,
    required this.iconBackground,
    required this.teacher,
    required this.location,
    required this.time,
    required this.date,
    required this.status,
  });
}
