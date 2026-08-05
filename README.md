# Kelas Mengaji Saderi — Flutter UI

UI Flutter berdasarkan design/screenshot yang diberikan (skema warna ungu + krim).

## Cara jalankan

```bash
flutter pub get
flutter run
```

## Struktur folder

```
lib/
├── main.dart                     # Entry point
├── screens/
│   ├── main_navigation.dart      # Shell + bottom nav (4 tab)
│   ├── home_page.dart            # Utama
│   ├── program_page.dart         # Kelas (senarai + carian + filter)
│   ├── program_detail_page.dart  # Detail Kelas
│   ├── schedule_page.dart        # Jadual (pemilih tarikh + senarai)
│   ├── teacher_list_page.dart    # Tenaga Pengajar
│   ├── teacher_detail_page.dart  # Profil Pengajar
│   ├── register_class_page.dart  # Daftar Kelas (borang 3 langkah)
│   └── contact_page.dart         # Hubungi
├── models/
│   ├── program_model.dart
│   ├── teacher_model.dart
│   └── schedule_model.dart
├── widgets/
│   ├── program_card.dart         # Kad kelas penuh (untuk senarai Kelas)
│   ├── class_card.dart           # Kad kelas ringkas (untuk "Kelas Pilihan")
│   ├── teacher_card.dart
│   ├── schedule_card.dart
│   ├── feature_item.dart         # Ikon "Guru Berpengalaman" dsb
│   ├── section_header.dart       # Tajuk seksyen + "Lihat Semua"
│   └── custom_bottom_nav.dart
├── data/
│   └── dummy_data.dart           # Data contoh (gantikan dengan API/Firestore)
└── theme/
    └── app_theme.dart            # Warna & gaya seluruh app
```

Saya tambah beberapa fail berbanding senarai asal anda kerana screenshot kedua
menunjukkan 4 skrin tambahan (Tenaga Pengajar, Profil Pengajar, Daftar Kelas,
Hubungi) — jadi saya susun ikut corak yang sama supaya konsisten dengan struktur
`program_page.dart` / `program_detail_page.dart` yang anda dah tetapkan.

## Cadangan penambahan

1. **google_fonts** — untuk padankan font custom seperti dalam design (nampak
   guna font sans-serif yang lebih "rounded" berbanding default Roboto).
2. **url_launcher** — supaya butang WhatsApp/Telefon/E-mel pada halaman Hubungi
   betul-betul buka aplikasi berkaitan.
3. **table_calendar** atau kalendar custom — jika nak paparan kalendar penuh
   (bukan sekadar 7 hari) pada halaman Jadual.
4. **Provider / Riverpod / Bloc** — apabila app dah sambung ke backend sebenar,
   state management akan bantu kendalikan data kelas, pendaftaran & auth guru.
5. **Firebase / REST API** — `dummy_data.dart` sengaja diasingkan supaya senang
   ditukar kepada panggilan data sebenar tanpa ubah UI.
6. **Validasi borang** — `register_class_page.dart` sekarang belum ada validasi
   (cth: nombor telefon wajib format tertentu, umur wajib nombor). Boleh guna
   `Form` + `TextFormField` + `validator`.
7. **Skeleton loading / shimmer** — bila data datang dari API, elok tambah
   loading state pada `ProgramPage`, `SchedulePage`, dan `TeacherListPage`.
8. **Notifikasi** — ikon loceng di halaman Utama belum functional; boleh
   sambungkan dengan Firebase Cloud Messaging untuk reminder kelas.
9. **Asset gambar sebenar** — semua "gambar" dalam UI ini guna ikon/placeholder
   berwarna. Untuk hasil lebih dekat dengan screenshot (gambar Al-Quran, foto
   guru), letak fail dalam `assets/images/` dan daftar dalam `pubspec.yaml`.

## Nota reka bentuk

- Warna utama: ungu gelap `#3D1150` (header/button), latar krim `#FAF6EE`.
- Semua warna disimpan berpusat di `lib/theme/app_theme.dart` (`AppColors`)
  supaya senang ubah tema keseluruhan app pada satu tempat sahaja.
- Data contoh (`DummyData`) mengandungi 4 kelas & 3 pengajar yang sepadan
  dengan apa yang ditunjukkan dalam screenshot anda (Asas Iqra', Mengaji
  Al-Quran, Tajwid & Taranum, Kelas Dewasa / Ustazah Aisyah, Ustaz Farid,
  Ustazah Nurul).
