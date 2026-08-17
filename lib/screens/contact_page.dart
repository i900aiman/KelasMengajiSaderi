import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const _faqs = [
    'Bagaimana cara mendaftar kelas?',
    'Berapakah yuran pendaftaran?',
  ];

  // --- Nombor & alamat hubungan (tukar ikut keperluan sebenar) ---
  static const _whatsappNumber = '60135805761'; // tanpa '+', '0' depan & simbol
  static const _phoneNumber = '+60135805761';
  static const _email = 'info@saderi.my';

  //BUKA WHATSAPP
  Future<void> _openWhatsApp(BuildContext context) async {
    final uri = Uri.parse('https://wa.me/$_whatsappNumber');
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      _showError(context, 'Tidak dapat membuka WhatsApp.');
    }
  }

  //BUKA PHONE CALL
  Future<void> _makePhoneCall(BuildContext context) async {
    final uri = Uri(scheme: 'tel', path: _phoneNumber);
    final launched = await launchUrl(uri);
    if (!launched && context.mounted) {
      _showError(context, 'Tidak dapat membuat panggilan.');
    }
  }

  //BUKA EMAIL
  Future<void> _sendEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: _email,
      query:
          'subject=${Uri.encodeComponent('Pertanyaan Kelas Mengaji Saderi')}',
    );
    final launched = await launchUrl(uri);
    if (!launched && context.mounted) {
      _showError(context, 'Tidak dapat membuka aplikasi e-mel.');
    }
  }

  //BUKA GOOGLE MAPS
  Future<void> _openGoogleMaps() async {
    // URL terus ke lat/long Presint 16, Putrajaya
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/place/PPAM+Saderi/@2.9361684,101.7066139,1027m/data=!3m2!1e3!4b1!4m6!3m5!1s0x31cdc9af780840ab:0x3f3c56b62460adef!8m2!3d2.9361684!4d101.7091888!16s%2Fg%2F11h55w6sht?entry=ttu&g_ep=EgoyMDI2MDgwMi4wIKXMDSoASAFQAw%3D%3D',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(
        googleMapsUrl,
        mode:
            LaunchMode.externalApplication, // Buka dalam tab baru untuk PWA/Web
      );
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 24),
          children: [
            const Text('Hubungi Kami',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark)),
            const SizedBox(height: 18),
            // Center(
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 30,
            //         backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            //         child: const Icon(Icons.menu_book_rounded,
            //             color: AppColors.primary, size: 28),
            //       ),
            //       const SizedBox(height: 10),
            //       const Text('Kami sedia membantu anda',
            //           style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: AppColors.textDark)),
            //       const SizedBox(height: 4),
            //       const Text('Pilih saluran hubungan yang sesuai dengan anda.',
            //           textAlign: TextAlign.center,
            //           style:
            //               TextStyle(fontSize: 12.5, color: AppColors.textGrey)),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 400,
                child: Image.asset("assets/images/kms_logo.png",fit: BoxFit.contain,)),
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
                    onTap: () => _openWhatsApp(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ContactChannel(
                    icon: Icons.call_rounded,
                    iconColor: AppColors.iconBlue,
                    label: 'Telefon',
                    value: '60135805761',
                    onTap: () => _makePhoneCall(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ContactChannel(
                    icon: Icons.mail_rounded,
                    iconColor: AppColors.iconMaroon,
                    label: 'E-mel',
                    value: _email,
                    onTap: () => _sendEmail(context),
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
                      const Icon(Icons.place_rounded,
                          color: AppColors.primary, size: 20),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Ops Apartment,\nJalan Presint 16, Presint 16,\n62150 Putrajaya',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textDark,
                              height: 1.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded,
                          color: AppColors.primary, size: 20),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Waktu Operasi',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark)),
                          Text('Sabtu - Ahad: 8:00 pagi - 5:00 petang',
                              style: TextStyle(
                                  fontSize: 12.5, color: AppColors.textGrey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Cadangan: ganti dengan google_maps_flutter untuk peta interaktif sebenar.
                  InkWell(
                    onTap: _openGoogleMaps,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                         image: AssetImage("assets/images/saderi_maps.png"), // Asset path
                          fit: BoxFit
                              .cover, // Stretches/crops image to cover the box
                        ),
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(0.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('Soalan Lazim',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark)),
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
                  title: Text(q,
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark)),
                  shape: const RoundedRectangleBorder(side: BorderSide.none),
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sila hubungi kami melalui WhatsApp atau telefon untuk maklumat lanjut.',
                          style: TextStyle(
                              fontSize: 12.5, color: AppColors.textGrey),
                        ),
                      ),
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
              CircleAvatar(
                  radius: 20,
                  backgroundColor: iconColor.withValues(alpha: 0.12),
                  child: Icon(icon, color: iconColor, size: 20)),
              const SizedBox(height: 8),
              Text(label,
                  style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark)),
              const SizedBox(height: 2),
              Text(value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 10.5, color: AppColors.textGrey)),
            ],
          ),
        ),
      ),
    );
  }
}
