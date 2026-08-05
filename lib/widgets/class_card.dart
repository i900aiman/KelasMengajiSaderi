import 'package:flutter/material.dart';
import '../models/program_model.dart';
import '../theme/app_theme.dart';

/// Kad kelas ringkas (kompak) - digunakan dalam grid "Kelas Pilihan"
/// pada halaman Utama.
class ClassCard extends StatelessWidget {
  final ProgramModel program;
  final VoidCallback onTap;

  const ClassCard({super.key, required this.program, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: program.iconBackground,
                  child: Icon(program.icon, color: Colors.white, size: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  program.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  program.badgeText,
                  style: TextStyle(fontSize: 11.5, color: program.badgeTextColor, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  program.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11.5, color: AppColors.textGrey, height: 1.3),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Lihat Butiran',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward_rounded, size: 13, color: AppColors.primary),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
