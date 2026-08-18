import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/jadual_entry_model.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/jadual_avatar.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/jadual_banner.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/timeline_jadual_page.dart';
import 'package:kelas_mengaji_saderi/theme/app_theme.dart';

class JadualPage extends StatelessWidget {
    final bool showBackButton;
    final bool showTitle;

  const JadualPage({
    super.key,
    this.showBackButton = false,
    this.showTitle =false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
  title: const Text('Jadual Kelas'),
  automaticallyImplyLeading: showBackButton,
),
      body: Container(
        decoration: const BoxDecoration(gradient: JadualTheme.backgroundGradient),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const SizedBox(height: 12),
              _HeaderBanner(),
              const SizedBox(height: 14),
              TeacherAvatarRow(teachers: kTeachers),
              const SizedBox(height: 4),
              JadualInfoBanner(nota: kJadualNota, masa: kJadualMasa),
              const SizedBox(height: 6),
              _ColumnLabels(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    for (final day in kJadualMingguan) JadualDayCard(day: day),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: JadualTheme.headerNavy,
        borderRadius: BorderRadius.circular(24),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.4),
          children: [
            TextSpan(text: 'JADUAL KELAS MENGAJI SADERI ', style: TextStyle(color: Colors.white)),
            TextSpan(text: 'TAHUN 2026/1447H', style: TextStyle(color: JadualTheme.gold)),
          ],
        ),
      ),
    );
  }
}

class _ColumnLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontStyle: FontStyle.italic);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('BILIK BACAAN', style: style.copyWith(color: const Color.fromARGB(255, 0, 0, 0))),
          Text('BILIK SERBAGUNA', style: style.copyWith(color: const Color.fromARGB(255, 13, 15, 13))),
        ],
      ),
    );
  }
}