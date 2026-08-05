import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../theme/app_theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const _faqs = [
    'Bagaimana cara mendaftar kelas?',
    'Berapakah yuran pendaftaran?',
  ];

  static const _whatsappNumber = '60135805761'; // format wa.me, tanpa '+'
static const _phoneNumber = '+60135805761';
static const _email = 'info@saderi.my';

Future<void> _openWhatsApp(BuildContext context) async {
  final uri = Uri.parse('https://wa.me/$_whatsappNumber');
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

Future<void> _makePhoneCall(BuildContext context) async {
  final uri = Uri(scheme: 'tel', path: _phoneNumber);
  await launchUrl(uri);
}

Future<void> _sendEmail(BuildContext context) async {
  final uri = Uri(scheme: 'mailto', path: _email, query: 'subject=...');
  await launchUrl(uri);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
          children: [
            const Text('Hubungi Kami',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 18),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: const Icon(Icons.menu_book_rounded, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(height: 10),
                  const Text('Kami sedia membantu anda',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 4),
                  const Text('Pilih saluran hubungan yang sesuai dengan anda.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.5, color: AppColors.textGrey)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: _ContactChannel(
                    icon: Icons.chat_bubble_rounded,
                    iconColor: const Color(0xFF25D366),
                    label: 'WhatsApp',
                    value: 'Klik untuk chat',
                    // Cadangan: guna pakej url_launcher untuk buka WhatsApp terus.
                    onTap: () {

                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ContactChannel(
                    icon: Icons.call_rounded,
                    iconColor: AppColors.primary,
                    label: 'Telefon',
                    value: '+6013-580 5761',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ContactChannel(
                    icon: Icons.mail_rounded,
                    iconColor: AppColors.primary,
                    label: 'E-mel',
                    value: 'info@saderi.my',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.place_rounded, color: AppColors.primary, size: 20),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Dewan Al-Saderi\nJalan Pendidikan, Taman Ilmu,\nKuala Lumpur, Malaysia',
                          style: TextStyle(fontSize: 13, color: AppColors.textDark, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, color: AppColors.primary, size: 20),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Waktu Operasi', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                          Text('Sabtu - Ahad: 8:00 pagi - 5:00 petang',
                              style: TextStyle(fontSize: 12.5, color: AppColors.textGrey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Cadangan: ganti dengan google_maps_flutter untuk peta interaktif sebenar.
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.location_pin, color: AppColors.primary, size: 30),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('Soalan Lazim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 10),
            ..._faqs.map(
              (q) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: ExpansionTile(
                  title: Text(q, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                  shape: const RoundedRectangleBorder(side: BorderSide.none),
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sila hubungi kami melalui WhatsApp atau telefon untuk maklumat lanjut.',
                          style: TextStyle(fontSize: 12.5, color: AppColors.textGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Hantar Pertanyaan'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactChannel extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactChannel({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              CircleAvatar(radius: 20, backgroundColor: iconColor.withValues(alpha: 0.12), child: Icon(icon, color: iconColor, size: 20)),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              const SizedBox(height: 2),
              Text(value, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.5, color: AppColors.textGrey)),
            ],
          ),
        ),
      ),
    );
  }
}
