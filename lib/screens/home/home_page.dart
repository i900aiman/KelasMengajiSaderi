import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/screens/home/poster_jadual_card.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/timeline_page.dart';
import 'package:kelas_mengaji_saderi/screens/yuran/yuran_search.dart';
import '../../data/dummy_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/class_card.dart';
import '../../widgets/feature_item.dart';
import '../../widgets/schedule_card.dart';
import '../../widgets/section_header.dart';
import '../program_detail_page.dart';
import '../program_page.dart';
import '../schedule_page.dart';

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
                    child: Image.asset(
                      "assets/images/kms_logo.png",
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                      fit: BoxFit.contain,
                    )),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Kelas Mengaji Saderi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                        height: 1.2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          const PosterJadualCard(), 
                const SizedBox(height: 16), 

            // --- 3 ciri utama ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child:  Row(
                children: [
                FeatureItem(
                      icon: Icons.monetization_on,
                      title: 'Yuran Mengaji',
                      subtitle:
                          'Serendah RM50 sebulan & Pendaftaran RM25 SEKALI sahaja',
                    ),
                  
                  FeatureItem(
                    icon: Icons.class_,
                    title: 'Kelas Mengaji',
                    subtitle:
                        'Untuk pelajar 5 - 17 tahun dibimbing oleh ustaz ustazah berpengalaman',
                  ),
                  FeatureItem(
                    icon: Icons.track_changes_outlined,
                    title: 'Target Kami',
                    subtitle:
                        'Setahun 2x ujian bertulis & hafazan. Buku rekod disediakan untuk pemantauan ibu bapa',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // --- Kelas Pilihan ---
            SectionHeader(
              title: 'Kelas Pilihan',
              onSeeAll: () {
                 Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ProgramPage(
                      showBackButton: true,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: featured
                  .map(
                    (p) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: p == featured.first ? 12 : 0),
                        child: ClassCard(
                          program: p,
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (_) =>
                            //           ProgramDetailPage(program: p)),
                            // );
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const JadualPage(
                      showBackButton: true,
                      showTitle: false,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            ...upcoming.take(1).map((s) => ScheduleCard(schedule: s)),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
