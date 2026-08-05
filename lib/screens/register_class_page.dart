import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/program_model.dart';
import '../theme/app_theme.dart';

class RegisterClassPage extends StatefulWidget {
  final ProgramModel? preselectedProgram;

  const RegisterClassPage({super.key, this.preselectedProgram});

  @override
  State<RegisterClassPage> createState() => _RegisterClassPageState();
}

class _RegisterClassPageState extends State<RegisterClassPage> {
  final _studentNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _guardianNameController = TextEditingController();
  final _phoneController = TextEditingController();

  ProgramModel? _selectedProgram;
  String? _selectedSchedule;
  bool _agreedToTerms = false;
  int _currentStep = 1; // Langkah 1 daripada 3

  @override
  void initState() {
    super.initState();
    _selectedProgram = widget.preselectedProgram;
  }

  @override
  void dispose() {
    _studentNameController.dispose();
    _ageController.dispose();
    _guardianNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickProgram() async {
    final result = await showModalBottomSheet<ProgramModel>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: DummyData.programs
                .map((p) => ListTile(
                      leading: CircleAvatar(backgroundColor: p.iconBackground, child: Icon(p.icon, color: Colors.white, size: 18)),
                      title: Text(p.title),
                      subtitle: Text('${p.day} · ${p.time}'),
                      onTap: () => Navigator.pop(context, p),
                    ))
                .toList(),
          ),
        );
      },
    );
    if (result != null) setState(() => _selectedProgram = result);
  }

  Future<void> _pickSchedule() async {
    if (_selectedProgram == null) return;
    setState(() => _selectedSchedule = '${_selectedProgram!.day}, ${_selectedProgram!.time}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kelas')),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 6, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Langkah $_currentStep daripada 3',
                  style: const TextStyle(fontSize: 13, color: AppColors.textGrey, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                children: List.generate(3, (index) {
                  final active = index < _currentStep;
                  return Expanded(
                    child: Container(
                      height: 5,
                      margin: EdgeInsets.only(right: index == 2 ? 0 : 6),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : AppColors.border,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _label('Nama Pelajar'),
                    TextField(
                      controller: _studentNameController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama penuh pelajar',
                        prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.textGrey),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _label('Umur'),
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan umur pelajar',
                        prefixIcon: Icon(Icons.calendar_today_outlined, color: AppColors.textGrey),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _label('Nama Penjaga'),
                    TextField(
                      controller: _guardianNameController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama penuh penjaga',
                        prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.textGrey),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _label('No. Telefon'),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Contoh: 012-345 6789',
                        prefixIcon: Icon(Icons.call_outlined, color: AppColors.textGrey),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _label('Pilih Kelas'),
                    _selectorField(
                      icon: Icons.menu_book_outlined,
                      value: _selectedProgram?.title,
                      hint: 'Cari dan pilih kelas',
                      onTap: _pickProgram,
                    ),
                    const SizedBox(height: 16),
                    _label('Pilih Jadual'),
                    _selectorField(
                      icon: Icons.access_time_rounded,
                      value: _selectedSchedule,
                      hint: 'Pilih hari dan masa',
                      onTap: _pickSchedule,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          activeColor: AppColors.primary,
                          onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(fontSize: 13, color: AppColors.textDark),
                                children: [
                                  TextSpan(text: 'Saya bersetuju dengan '),
                                  TextSpan(
                                    text: 'terma pendaftaran',
                                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
          child: ElevatedButton(
            onPressed: _agreedToTerms
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pendaftaran diteruskan ke langkah seterusnya.')),
                    );
                  }
                : null,
            child: const Text('Seterusnya'),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDark)),
      );

  Widget _selectorField({required IconData icon, String? value, required String hint, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textGrey, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value ?? hint,
                style: TextStyle(fontSize: 14, color: value != null ? AppColors.textDark : AppColors.textGrey),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textGrey),
          ],
        ),
      ),
    );
  }
}
