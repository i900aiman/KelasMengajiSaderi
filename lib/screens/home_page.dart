import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../theme/app_theme.dart';
import '../widgets/class_card.dart';
import '../widgets/feature_item.dart';
import '../widgets/schedule_card.dart';
import '../widgets/section_header.dart';
import 'program_detail_page.dart';
import 'program_page.dart';
import 'schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = DummyData.programs.take(2).toList();
    final upcoming = DummyData.scheduleForWeek(DateTime.now());

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
          children: [
            // --- Header: logo + tajuk + notifikasi ---
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/images/kms_logo.png", filterQuality: FilterQuality.high,isAntiAlias: true,fit: BoxFit.contain,)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Kelas Mengaji Saderi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark, height: 1.2),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_rounded, color: AppColors.textDark),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Banner utama ---
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Belajar Al-Quran\nDengan Mudah & Teratur',
                    style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold, height: 1.3),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Bimbingan mengaji secara berperingkat untuk kanak-kanak dan dewasa.',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13, height: 1.4),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProgramPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      minimumSize: const Size(0, 44),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Daftar Sekarang', style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward_rounded, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // --- 3 ciri utama ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  FeatureItem(
                    icon: Icons.auto_awesome_rounded,
                    title: 'Guru Berpengalaman',
                    subtitle: 'Berpengalaman & dedikasi tinggi',
                  ),
                  FeatureItem(
                    icon: Icons.shield_outlined,
                    title: 'Kelas Berperingkat',
                    subtitle: 'Disusun mengikut keupayaan',
                  ),
                  FeatureItem(
                    icon: Icons.menu_book_outlined,
                    title: 'Bimbingan Teratur',
                    subtitle: 'Program tersusun & berkesan',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // --- Kelas Pilihan ---
            SectionHeader(
              title: 'Kelas Pilihan',
              onSeeAll: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProgramPage()));
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: featured
                  .map(
                    (p) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: p == featured.first ? 12 : 0),
                        child: ClassCard(
                          program: p,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => ProgramDetailPage(program: p)),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 22),

            // --- Jadual Terdekat ---
            SectionHeader(
              title: 'Jadual Terdekat',
              onSeeAll: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SchedulePage()));
              },
            ),
            const SizedBox(height: 12),
            ...upcoming.take(2).map((s) => ScheduleCard(schedule: s)),
          ],
        ),
      ),
    );
  }
}
