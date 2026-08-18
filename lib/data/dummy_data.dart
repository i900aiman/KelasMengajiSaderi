import 'package:flutter/material.dart';
import '../models/program_model.dart';
import '../models/teacher_model.dart';
import '../models/schedule_model.dart';
import '../theme/app_theme.dart';

/// Sumber data contoh (dummy) untuk seluruh aplikasi.
/// Gantikan dengan panggilan API / Firestore apabila backend sedia.
class DummyData {
  DummyData._();

  static const List<String> filterCategories = [
    'Semua',
    'Kanak-Kanak',
    'Dewasa',
    'Online',
  ];

  static final List<ProgramModel> programs = [
    ProgramModel(
      id: 'asas-iqra',
      title: "Kelas Bilik Serbaguna/Bilik Bacaan",
      subtitle: '(Kelas Mengaji yang dibimbing oleh 7orang ustaz & ustazah)',
      badgeText: 'Tahap Permulaan',
      badgeColor: AppColors.iconPurple.withValues(alpha: 0.12),
      badgeTextColor: AppColors.iconPurple,
      icon: Icons.menu_book_rounded,
      iconBackground: AppColors.iconPurple,
      day: 'Sabtu & Ahad',
      time: '9:00 - 10:00 pagi',
      location: 'Dewan Al-Saderi',
      teacher: 'Ustazah Aisyah',
      price: 'RM50 / bulan',
      category: const ['Semua', 'Kanak-Kanak'],
      whatYouLearn: const [
        'Mengenal huruf hijaiyah',
        'Sebutan makhraj huruf asas',
        'Bacaan suku kata mudah',
        'Latihan berperingkat mengikut kemampuan',
      ],
    ),
    ProgramModel(
      id: 'mengaji-al-quran',
      title: 'Kelas Berfokus',
      subtitle: 'Terhad kerpada 8orang SAHAJA, dimbimbing oleh Ustaz Muqri.',
      badgeText: 'Semua Umur',
      badgeColor: AppColors.iconBlue.withValues(alpha: 0.12),
      badgeTextColor: AppColors.iconBlue,
      icon: Icons.menu_book_rounded,
      iconBackground: AppColors.iconBlue,
      day: 'Sabtu & Ahad',
      time: '10:00 - 11:00 pagi',
      location: 'Dewan Al-Saderi',
      teacher: 'Ustazah Aisyah',
      price: 'RM60 / bulan',
      category: const ['Semua', 'Kanak-Kanak', 'Dewasa'],
      whatYouLearn: const [
        'Membaca Al-Quran dengan tajwid yang betul',
        'Makharijul huruf dan sifat-sifat huruf',
        'Hukum-hukum tajwid asas',
        'Latihan bacaan dan semakan berkala',
        'Bimbingan berperingkat mengikut kemampuan',
      ],
    ),
    ProgramModel(
      id: 'tajwid-taranum',
      title: 'Kelas Private',
      subtitle: 'Terhad kepada Pelajar Hafazan SAHAJA',
      badgeText: 'Kanak-Kanak & Dewasa',
      badgeColor: AppColors.iconMaroon.withValues(alpha: 0.12),
      badgeTextColor: AppColors.iconMaroon,
      icon: Icons.auto_awesome_rounded,
      iconBackground: AppColors.iconMaroon,
      day: 'Ahad',
      time: '11:15 pagi - 12:15 tgh',
      location: 'Bilik 2',
      teacher: 'Ustaz Farid',
      price: 'RM70 / bulan',
      category: const ['Semua', 'Kanak-Kanak', 'Dewasa'],
      whatYouLearn: const [
        'Hukum tajwid tahap pertengahan & lanjutan',
        'Pengenalan lagu-lagu taranum',
        'Latihan irama dan sebutan',
        'Persediaan untuk pertandingan tilawah',
      ],
    )
  ];

  static final List<TeacherModel> teachers = [
    TeacherModel(
      id: 'ustazah-aisyah',
      name: 'Ustazah Aisyah',
      subjects: const ["Asas Iqra'", 'Kanak-Kanak'],
      yearsExperience: 8,
      studentsCount: 120,
      rating: 4.9,
      badge: 'Guru Berpengalaman',
      about:
          "Ustazah Aisyah berpengalaman dalam pengajaran Asas Iqra' dan Mengaji Al-Quran untuk semua peringkat umur, terutamanya kanak-kanak dan dewasa awal. Pendekatan mesra dan sabar membantu pelajar membina asas yang kukuh.",
      classesHandled: const [
        TeacherClass(
          programId: 'asas-iqra',
          title: "Asas Iqra'",
          ageOrLevel: '6 - 12 tahun',
          day: 'Sabtu & Ahad',
          time: '9:00 - 10:00 pagi',
        ),
        TeacherClass(
          programId: 'mengaji-al-quran',
          title: 'Mengaji Al-Quran',
          ageOrLevel: 'Semua umur',
          day: 'Sabtu & Ahad',
          time: '10:00 - 11:00 pagi',
        ),
      ],
    ),
    TeacherModel(
      id: 'ustaz-farid',
      name: 'Ustaz Farid',
      subjects: const ['Mengaji Al-Quran', 'Tajwid'],
      yearsExperience: 7,
      studentsCount: 95,
      rating: 4.8,
      badge: 'Guru Berpengalaman',
      about:
          'Ustaz Farid menumpukan kepada penguasaan tajwid dan taranum, dengan pengalaman membimbing pelajar untuk pertandingan tilawah di peringkat daerah.',
      classesHandled: const [
        TeacherClass(
          programId: 'tajwid-taranum',
          title: 'Tajwid & Taranum',
          ageOrLevel: 'Kanak-Kanak & Dewasa',
          day: 'Ahad',
          time: '11:15 pagi - 12:15 tgh',
        ),
      ],
    ),
    TeacherModel(
      id: 'ustazah-nurul',
      name: 'Ustazah Nurul',
      subjects: const ['Tajwid & Tarannum', 'Dewasa'],
      yearsExperience: 5,
      studentsCount: 60,
      rating: 4.7,
      badge: 'Guru Berdedikasi',
      about:
          'Ustazah Nurul mengendalikan kelas dewasa dengan suasana santai dan tidak tergesa-gesa, sesuai untuk jemaah yang baru mahu memperbaiki bacaan.',
      classesHandled: const [
        TeacherClass(
          programId: 'kelas-dewasa',
          title: 'Kelas Dewasa',
          ageOrLevel: 'Dewasa',
          day: 'Sabtu',
          time: '8:00 - 9:00 malam',
        ),
      ],
    ),
  ];

  /// Jadual untuk minggu contoh (21 - 27 Mei).
  static List<ScheduleModel> scheduleForWeek(DateTime weekStart) {
    return [
      ScheduleModel(
        id: 'sch-1',
        programId: 'asas-iqra',
        title: "Asas Iqra'",
        icon: Icons.menu_book_rounded,
        iconBackground: AppColors.iconPurple,
        teacher: 'Ustazah Aisyah',
        location: 'Dewan Al-Saderi',
        time: '9:00 - 10:00 pagi',
        date: weekStart.add(const Duration(days: 3)), // Sabtu
        status: ScheduleStatus.tersedia,
      ),
      ScheduleModel(
        id: 'sch-2',
        programId: 'mengaji-al-quran',
        title: 'Mengaji Al-Quran',
        icon: Icons.menu_book_rounded,
        iconBackground: AppColors.iconBlue,
        teacher: 'Ustazah Aisyah',
        location: 'Dewan Al-Saderi',
        time: '10:00 - 11:00 pagi',
        date: weekStart.add(const Duration(days: 3)),
        status: ScheduleStatus.tersedia,
      ),
      ScheduleModel(
        id: 'sch-3',
        programId: 'tajwid-taranum',
        title: 'Tajwid & Taranum',
        icon: Icons.auto_awesome_rounded,
        iconBackground: AppColors.iconMaroon,
        teacher: 'Ustaz Farid',
        location: 'Bilik 2',
        time: '11:15 pagi - 12:15 tgh',
        date: weekStart.add(const Duration(days: 3)),
        status: ScheduleStatus.hampirPenuh,
      ),
      ScheduleModel(
        id: 'sch-4',
        programId: 'kelas-dewasa',
        title: 'Kelas Dewasa',
        icon: Icons.person_rounded,
        iconBackground: AppColors.iconGreen,
        teacher: 'Ustazah Nurul',
        location: 'Dewan Al-Saderi',
        time: '8:00 - 9:00 malam',
        date: weekStart.add(const Duration(days: 3)),
        status: ScheduleStatus.tersedia,
      ),
    ];
  }
}
