import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/teacher_model.dart';
import 'package:kelas_mengaji_saderi/theme/app_theme.dart';

/// One coloured ribbon entry in a day's schedule (e.g. "Ustazah Aidah").
class JadualSlot {
  final String name;
  final Color color;
  final Color textColor;

  const JadualSlot({
    required this.name,
    required this.color,
    this.textColor = const Color(0xFF1E2430),
  });
}

/// A full day's schedule: Bilik Bacaan on the left, Bilik Serbaguna on the right.
class JadualDay {
  final String day;
  final List<JadualSlot> bilikBacaan;
  final List<JadualSlot> bilikServaguna;

  const JadualDay({
    required this.day,
    required this.bilikBacaan,
    required this.bilikServaguna,
  });
}


/// Teachers shown in the header, in poster order.
const List<Teacher> kTeachers = [
  Teacher(name: 'Fakhrul', honorific: 'Ustaz', photoAsset: 'assets/images/fakhrul.jpeg'),
  Teacher(name: 'Kholil', honorific: 'Ustaz', photoAsset: 'assets/images/kholil.jpeg'),
  Teacher(name: 'Ameer', honorific: 'Ustaz', role: 'Pengurus', photoAsset: 'assets/images/ameer.jpeg'),
  Teacher(name: 'Muqri', honorific: 'Ustaz', photoAsset: 'assets/images/muqri.jpeg'),
  Teacher(name: 'Afif', honorific: 'Ustaz', photoAsset: 'assets/images/afif.jpeg'),
  Teacher(name: 'Ameera', honorific: 'Ustazah', photoAsset: 'assets/images/ameera.jpeg'),
  Teacher(name: 'Aidah', honorific: 'Ustazah', photoAsset: 'assets/images/aidah.jpeg'),
  Teacher(name: 'Hidayah', honorific: 'Ustazah', photoAsset: 'assets/images/hidayah.jpeg'),
];

/// Weekly schedule, Isnin -> Jumaat, matching the poster exactly.
final List<JadualDay> kJadualMingguan = [
  const JadualDay(
    day: 'Isnin',
    bilikBacaan: [
      JadualSlot(name: 'Ustazah Aidah', color: JadualTheme.ribbonPurple),
    ],
    bilikServaguna: [
      JadualSlot(name: 'Ustaz Kholil', color: JadualTheme.ribbonOrange),
      JadualSlot(name: 'Ustaz Fakhrul', color: JadualTheme.ribbonRed),
    ],
  ),
  const JadualDay(
    day: 'Selasa',
    bilikBacaan: [
      JadualSlot(name: 'Ustaz Afif', color: JadualTheme.ribbonBlue),
      JadualSlot(name: 'Ustazah Ameera', color: JadualTheme.ribbonCream),
    ],
    bilikServaguna: [
      JadualSlot(name: 'Ustaz Kholil', color: JadualTheme.ribbonOrange),
      JadualSlot(name: 'Ustaz Fakhrul', color: JadualTheme.ribbonRed),
    ],
  ),
  const JadualDay(
    day: 'Rabu',
    bilikBacaan: [
      JadualSlot(name: 'Ustazah Hidayah', color: JadualTheme.ribbonYellow),
      JadualSlot(name: 'Ustazah Ameera', color: JadualTheme.ribbonCream),
    ],
    bilikServaguna: [
      JadualSlot(name: 'Ustaz Afif', color: JadualTheme.ribbonBlue),
      JadualSlot(name: 'Ustazah Aidah', color: JadualTheme.ribbonPurple),
    ],
  ),
  const JadualDay(
    day: 'Khamis',
    bilikBacaan: [
      JadualSlot(name: 'Ustaz Afif', color: JadualTheme.ribbonBlue),
      JadualSlot(name: 'Ustazah Hidayah', color: JadualTheme.ribbonYellow),
    ],
    bilikServaguna: [
      JadualSlot(name: 'Ustaz Kholil', color: JadualTheme.ribbonOrange),
      JadualSlot(name: 'Ustaz Fakhrul', color: JadualTheme.ribbonRed),
    ],
  ),
  const JadualDay(
    day: 'Jumaat',
    bilikBacaan: [
      JadualSlot(name: 'Ustazah Ameera', color: JadualTheme.ribbonCream),
      JadualSlot(name: 'Ustaz Muqri', color: JadualTheme.ribbonGreen),
    ],
    bilikServaguna: [
      JadualSlot(name: 'Ustazah Aidah', color: JadualTheme.ribbonPurple),
    ],
  ),
];

/// Extra info requested for the page: applies to every class.
const String kJadualNota = 'Semua kelas malam';
const String kJadualMasa = '8:00 - 9:30 malam';