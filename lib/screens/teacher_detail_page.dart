import 'package:flutter/material.dart';
import '../models/teacher_model.dart';
import '../theme/app_theme.dart';
import 'register_class_page.dart';

class TeacherDetailPage extends StatelessWidget {
  final TeacherModel teacher;

  const TeacherDetailPage({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengajar')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 6, 18, 100),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  backgroundImage: teacher.photoUrl != null ? NetworkImage(teacher.photoUrl!) : null,
                  child: teacher.photoUrl == null
                      ? Icon(Icons.person_rounded, color: AppColors.primary, size: 42)
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(teacher.name,
                          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.shield_rounded, size: 13, color: AppColors.primary),
                            const SizedBox(width: 4),
                            Text(teacher.badge,
                                style: const TextStyle(fontSize: 11.5, color: AppColors.primary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(teacher.subjects.join(' & '),
                          style: const TextStyle(fontSize: 13.5, color: AppColors.textGrey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  _stat(Icons.calendar_today_rounded, '${teacher.yearsExperience}', 'Tahun\nPengalaman'),
                  _statDivider(),
                  _stat(Icons.groups_rounded, '${teacher.studentsCount}', 'Pelajar\nDibimbing'),
                  _statDivider(),
                  _stat(Icons.star_rounded, teacher.rating.toString(), 'Penilaian\nPurata'),
                ],
              ),
            ),
            const SizedBox(height: 22),

            const Text('Tentang Pengajar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 8),
            Text(teacher.about, style: const TextStyle(fontSize: 13.5, color: AppColors.textGrey, height: 1.5)),
            const SizedBox(height: 22),

            const Text('Kelas Dikendalikan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 10),
            ...teacher.classesHandled.map(
              (c) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primary,
                      child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textDark)),
                          const SizedBox(height: 2),
                          Text(c.ageOrLevel, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(c.day, style: const TextStyle(fontSize: 12, color: AppColors.textDark)),
                        Text(c.time, style: const TextStyle(fontSize: 11.5, color: AppColors.textGrey)),
                      ],
                    ),
                    const Icon(Icons.chevron_right_rounded, color: AppColors.textGrey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterClassPage()));
            },
            child: const Text('Pilih Kelas'),
          ),
        ),
      ),
    );
  }

  Widget _stat(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.5, color: AppColors.textGrey, height: 1.3)),
        ],
      ),
    );
  }

  Widget _statDivider() => Container(width: 1, height: 46, color: AppColors.border);
}
