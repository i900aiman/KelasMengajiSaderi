import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/screens/gallery/gallery_page.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/timeline_page.dart';
import 'package:kelas_mengaji_saderi/screens/yuran/yuran_search.dart';
import '../widgets/custom_bottom_nav.dart';
import 'contact_page.dart';
import 'home/home_page.dart';
import 'program_page.dart';
import 'schedule_page.dart';

/// Shell utama aplikasi - memegang 4 tab bawah (Utama, Kelas, Jadual, Hubungi).
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final _pages = const [
    HomePage(),
    YuranSearchPage(),
    JadualPage(),
    GalleryPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
