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
    'Umum',
    'Khusus',
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
      category: const ['Semua', 'Umum'],
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
      category: const ['Semua', 'Khusus'],
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
      badgeText: 'Umum & Khusus',
      badgeColor: AppColors.iconMaroon.withValues(alpha: 0.12),
      badgeTextColor: AppColors.iconMaroon,
      icon: Icons.auto_awesome_rounded,
      iconBackground: AppColors.iconMaroon,
      day: 'Ahad',
      time: '11:15 pagi - 12:15 tgh',
      location: 'Bilik 2',
      teacher: 'Ustaz Farid',
      price: 'RM70 / bulan',
      category: const ['Semua', 'Khusus'],
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
      subjects: const ["Asas Iqra'", 'Umum'],
      yearsExperience: 8,
      studentsCount: 120,
      rating: 4.9,
      badge: 'Guru Berpengalaman',
      about:
          "Ustazah Aisyah berpengalaman dalam pengajaran Asas Iqra' dan Mengaji Al-Quran untuk semua peringkat umur, terutamanya umum dan khusus awal. Pendekatan mesra dan sabar membantu pelajar membina asas yang kukuh.",
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
          ageOrLevel: 'Umum & Khusus',
          day: 'Ahad',
          time: '11:15 pagi - 12:15 tgh',
        ),
      ],
    ),
    TeacherModel(
      id: 'ustazah-nurul',
      name: 'Ustazah Nurul',
      subjects: const ['Tajwid & Tarannum', 'Khusus'],
      yearsExperience: 5,
      studentsCount: 60,
      rating: 4.7,
      badge: 'Guru Berdedikasi',
      about:
          'Ustazah Nurul mengendalikan kelas khusus dengan suasana santai dan tidak tergesa-gesa, sesuai untuk jemaah yang baru mahu memperbaiki bacaan.',
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

  /// Jadual untuk minggu CONTOH (data statik, 21 - 27 Mei) — dikekalkan
  /// (di-rename dari 'scheduleForWeek' asal) sebab nama tu clash dengan
  /// method baru di bawah. Kalau tiada tempat lain dalam app panggil
  /// fungsi ni secara spesifik, boleh je dipadam terus.
  static List<ScheduleModel> scheduleForSampleWeek(DateTime weekStart) {
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

  static const List<_ScheduleSlot> _weeklySchedule = [
    _ScheduleSlot(weekday: DateTime.monday, room: 'Bilik Bacaan', teachers: ['Ustazah Aidah']),
    _ScheduleSlot(weekday: DateTime.monday, room: 'Bilik Serbaguna', teachers: ['Ustaz Kholil', 'Ustaz Fakhrul']),
    _ScheduleSlot(weekday: DateTime.tuesday, room: 'Bilik Bacaan', teachers: ['Ustaz Afif', 'Ustazah Ameera']),
    _ScheduleSlot(weekday: DateTime.tuesday, room: 'Bilik Serbaguna', teachers: ['Ustaz Kholil', 'Ustaz Fakhrul']),
    _ScheduleSlot(weekday: DateTime.wednesday, room: 'Bilik Bacaan', teachers: ['Ustazah Hidayah', 'Ustazah Ameera']),
    _ScheduleSlot(weekday: DateTime.wednesday, room: 'Bilik Serbaguna', teachers: ['Ustaz Afif', 'Ustazah Aidah']),
    _ScheduleSlot(weekday: DateTime.thursday, room: 'Bilik Bacaan', teachers: ['Ustaz Afif', 'Ustazah Hidayah']),
    _ScheduleSlot(weekday: DateTime.thursday, room: 'Bilik Serbaguna', teachers: ['Ustaz Kholil', 'Ustaz Fakhrul']),
    _ScheduleSlot(weekday: DateTime.friday, room: 'Bilik Bacaan', teachers: ['Ustazah Ameera', 'Ustaz Muqri']),
    _ScheduleSlot(weekday: DateTime.friday, room: 'Bilik Serbaguna', teachers: ['Ustazah Aidah']),
  ];

  static const _dayNames = {
    DateTime.monday: 'Isnin',
    DateTime.tuesday: 'Selasa',
    DateTime.wednesday: 'Rabu',
    DateTime.thursday: 'Khamis',
    DateTime.friday: 'Jumaat',
  };

  /// Jadual kelas akan datang — semua kelas Isnin-Jumaat, waktu seragam
  /// 8:00-9:30 malam. Dikira ikut tarikh sebenar terdekat dari [now],
  /// disusun ikut yang paling dekat dahulu. Ni method yang dipanggil oleh
  /// homepage.dart (DummyData.scheduleForWeek(DateTime.now())).
  static List<ScheduleModel> scheduleForWeek(DateTime now) {
    const time = '8:00 - 9:30 malam';
    const startHour = 20; // 8 malam — untuk tentukan dah lepas waktu ke belum

    final items = _weeklySchedule.map((slot) {
      final date = _nextOccurrence(slot.weekday, now, startHour);
      final daySlug = _dayNames[slot.weekday]!.toLowerCase();
      final roomSlug = slot.room == 'Bilik Bacaan' ? 'bacaan' : 'serbaguna';

      return ScheduleModel(
        id: 'kelas-$daySlug-$roomSlug',
        // NOTA: kelas mingguan (Isnin-Jumaat) ni tak sepadan dengan
        // mana-mana ProgramModel sedia ada (semua program tu Sabtu/Ahad).
        // 'programId' bawah ni placeholder sahaja — kalau nanti ScheduleCard
        // dapat 'onTap' yang cari program guna id ni, ia akan gagal sebab
        // takde ProgramModel dengan id ni. Selamat buat masa ni sebab
        // homepage.dart panggil ScheduleCard tanpa onTap untuk list ni.
        programId: 'kelas-mengaji-mingguan',
        title: 'Kelas ${_dayNames[slot.weekday]}',
        icon: slot.room == 'Bilik Bacaan' ? Icons.menu_book_rounded : Icons.groups_rounded,
        iconBackground: AppColors.primary,
        teacher: slot.teachers.join(' & '),
        location: slot.room,
        time: time,
        date: date,
        status: ScheduleStatus.tersedia,
      );
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return items;
  }

  static DateTime _nextOccurrence(int weekday, DateTime now, int startHour) {
    var date = DateTime(now.year, now.month, now.day, startHour);
    final diff = (weekday - date.weekday) % 7;
    date = date.add(Duration(days: diff));
    if (date.isBefore(now)) date = date.add(const Duration(days: 7));
    return date;
  }
}

class _ScheduleSlot {
  final int weekday;
  final String room;
  final List<String> teachers;
  const _ScheduleSlot({required this.weekday, required this.room, required this.teachers});
}