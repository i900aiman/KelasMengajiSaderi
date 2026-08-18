import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/theme/app_theme.dart';

/// Small pill banner shown under the header stating that every class
/// is at night, and the time range — the two additions requested.
class JadualInfoBanner extends StatelessWidget {
  final String nota;
  final String masa;

  const JadualInfoBanner({super.key, required this.nota, required this.masa});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: JadualTheme.headerNavy,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: JadualTheme.gold, width: 1.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.nightlight_round, color: JadualTheme.gold, size: 18),
          const SizedBox(width: 8),
          Text(
            nota,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
          ),
          const SizedBox(width: 14),
          Container(width: 1, height: 14, color: Colors.white24),
          const SizedBox(width: 14),
          const Icon(Icons.access_time_filled, color: JadualTheme.gold, size: 18),
          const SizedBox(width: 8),
          Text(
            masa,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ],
      ),
    );
  }
}