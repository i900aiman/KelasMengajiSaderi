import 'package:flutter/material.dart';

/// Warna & gaya utama aplikasi Kelas Mengaji Saderi.
/// Dipadankan dengan skema warna ungu + krim dalam design (screenshots).
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF3D1150); // ungu gelap (header/button)
  static const Color primaryLight = Color(0xFF5C1E73);
  static const Color background = Color(0xFFFAF6EE); // krim/off-white
  static const Color cardBackground = Colors.white;
  static const Color textDark = Color(0xFF231A2B);
  static const Color textGrey = Color(0xFF7C7683);
  static const Color border = Color(0xFFEDE7DD);

  // Warna ikon kelas (padanan dengan setiap kad kelas)
  static const Color iconPurple = Color(0xFF3D1150);
  static const Color iconBlue = Color(0xFF3C6FA6);
  static const Color iconMaroon = Color(0xFF9B2C5E);
  static const Color iconGreen = Color(0xFF6E8F3E);

  // Status badge
  static const Color statusAvailableBg = Color(0xFFD9EAD3);
  static const Color statusAvailableText = Color(0xFF3F7D3A);
  static const Color statusAlmostFullBg = Color(0xFFF7E2B8);
  static const Color statusAlmostFullText = Color(0xFF8A5A00);
  static const Color statusFullBg = Color(0xFFF3D3D3);
  static const Color statusFullText = Color(0xFF9C2B2B);
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      fontFamily: 'Roboto', // Gantikan dengan font custom (cth: Poppins) via google_fonts jika mahu
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textDark),
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
