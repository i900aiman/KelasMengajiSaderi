import 'package:flutter/material.dart';

/// Model untuk satu kelas mengaji (cth: Asas Iqra', Mengaji Al-Quran).
class ProgramModel {
  final String id;
  final String title;
  final String subtitle;
  final String badgeText; // cth: "Tahap Permulaan", "Semua Umur"
  final Color badgeColor;
  final Color badgeTextColor;
  final IconData icon;
  final Color iconBackground;
  final String day; // cth: "Sabtu & Ahad"
  final String time; // cth: "9:00 - 10:00 pagi"
  final String location;
  final String teacher;
  final String price; // cth: "RM60 / bulan"
  final List<String> category; // untuk filter: Semua, Kanak-Kanak, Dewasa, Online
  final List<String> whatYouLearn;

  const ProgramModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.icon,
    required this.iconBackground,
    required this.day,
    required this.time,
    required this.location,
    required this.teacher,
    required this.price,
    required this.category,
    required this.whatYouLearn,
  });
}
