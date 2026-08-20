import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/screens/timeline/timeline_page.dart';

/// Poster jadual dipaparkan sebagai "teaser" visual penuh lebar (ikut
/// aspect ratio asal, tak dipotong paksa). Ketik poster akan bawa terus ke
/// JadualPage sedia ada — versi native yang senang dibaca — bukan sekadar
/// zoom gambar statik. Ni elak dua salinan maklumat jadual (poster imej +
/// JadualPage) yang boleh out-of-sync bila jadual guru berubah nanti.
class PosterJadualCard extends StatelessWidget {
  const PosterJadualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const JadualPage(
              showBackButton: true,
              showTitle: false,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // width sahaja diberi (tiada height tetap) supaya poset kekal
            // ikut aspect ratio asal — tak dipotong hodoh macam crop paksa
            Image.asset(
              'assets/images/jadual_kms.jpeg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            // gradient nipis + label CTA kat bawah poster
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.55),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Jadual Kelas Mengaji Saderi',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Lihat penuh',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}