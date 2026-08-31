import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/program_model.dart';
import '../theme/app_theme.dart';
import '../widgets/program_card.dart';
import 'program_detail_page.dart';

class ProgramPage extends StatefulWidget {
   final bool showBackButton;

  const ProgramPage({
  super.key,
  this.showBackButton = false});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  String _selectedFilter = 'Semua';
  String _searchQuery = '';

  List<ProgramModel> get _filteredPrograms {
    return DummyData.programs.where((p) {
      final matchesFilter = _selectedFilter == 'Semua' || p.category.contains(_selectedFilter);
      final matchesSearch = _searchQuery.isEmpty ||
          p.title.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showBackButton
        ? AppBar(
            title: const Text('Kelas Mengaji'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textDark),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kelas Mengaji',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
              const SizedBox(height: 14),
              TextField(
                onChanged: (v) => setState(() => _searchQuery = v),
                decoration: const InputDecoration(
                  hintText: 'Cari kelas',
                  prefixIcon: Icon(Icons.search_rounded, color: AppColors.textGrey),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: DummyData.filterCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = DummyData.filterCategories[index];
                    final selected = category == _selectedFilter;
                    return ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      onSelected: (_) => setState(() => _selectedFilter = category),
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : AppColors.textDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _filteredPrograms.isEmpty
                    ? const Center(
                        child: Text('Tiada kelas dijumpai.', style: TextStyle(color: AppColors.textGrey)),
                      )
                    : ListView.builder(
                        itemCount: _filteredPrograms.length,
                        itemBuilder: (context, index) {
                          final program = _filteredPrograms[index];
                          return ProgramCard(
                            program: program,
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (_) => ProgramDetailPage(program: program)),
                              // );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
