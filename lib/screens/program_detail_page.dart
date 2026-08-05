import 'package:flutter/material.dart';
import '../models/program_model.dart';
import '../theme/app_theme.dart';
import 'register_class_page.dart';
import 'teacher_list_page.dart';

class ProgramDetailPage extends StatelessWidget {
  final ProgramModel program;

  const ProgramDetailPage({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kelas')),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 100),
          children: [
            // --- Gambar / ikon hero ---
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: program.iconBackground.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Icon(program.icon, size: 64, color: program.iconBackground),
              ),
            ),
            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: Text(
                    program.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _tag(program.badgeText, AppColors.primary.withValues(alpha: 0.1), AppColors.primary),
                _tag('Berperingkat', AppColors.iconBlue.withValues(alpha: 0.1), AppColors.iconBlue),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              program.subtitle,
              style: const TextStyle(fontSize: 14, color: AppColors.textGrey, height: 1.5),
            ),
            const SizedBox(height: 18),

            // --- Info kelas ---
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  _infoRow(Icons.calendar_today_rounded, program.day),
                  _divider(),
                  _infoRow(Icons.access_time_rounded, program.time),
                  _divider(),
                  _infoRow(Icons.place_outlined, program.location),
                  _divider(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const TeacherListPage()),
                      );
                    },
                    child: _infoRow(Icons.person_outline_rounded, program.teacher, trailing: true),
                  ),
                  _divider(),
                  _infoRow(Icons.attach_money_rounded, program.price),
                ],
              ),
            ),
            const SizedBox(height: 22),

            const Text(
              'Apa yang dipelajari',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
            ),
            const SizedBox(height: 10),
            ...program.whatYouLearn.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 19),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(item, style: const TextStyle(fontSize: 13.5, color: AppColors.textDark, height: 1.4)),
                    ),
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => RegisterClassPage(preselectedProgram: program)),
              );
            },
            child: const Text('Daftar Kelas'),
          ),
        ),
      ),
    );
  }

  Widget _tag(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: fg)),
    );
  }

  Widget _infoRow(IconData icon, String text, {bool trailing = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 19, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textDark))),
          if (trailing) const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.textGrey),
        ],
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, color: AppColors.border);
}
