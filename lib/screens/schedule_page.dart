import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/schedule_model.dart';
import '../theme/app_theme.dart';
import '../widgets/schedule_card.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  static const _dayLabels = ['Isn', 'Sel', 'Rab', 'Kha', 'Jum', 'Sab', 'Ahd'];

  late DateTime _weekStart;
  late DateTime _selectedDate;
  late List<ScheduleModel> _allSchedules;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    // Cari Isnin minggu semasa supaya paparan selari dengan reka bentuk.
    _weekStart = now.subtract(Duration(days: now.weekday - 1));
    _selectedDate = now;
    _allSchedules = DummyData.scheduleForWeek(_weekStart);
  }

  bool _isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final schedulesForDay = _allSchedules.where((s) => _isSameDay(s.date, _selectedDate)).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Jadual Kelas',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded, color: AppColors.textDark),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 74,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final date = _weekStart.add(Duration(days: index));
                    final selected = _isSameDay(date, _selectedDate);
                    return GestureDetector(
                      onTap: () => setState(() => _selectedDate = date),
                      child: Container(
                        width: 56,
                        decoration: BoxDecoration(
                          color: selected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _dayLabels[date.weekday - 1],
                              style: TextStyle(
                                fontSize: 12,
                                color: selected ? Colors.white70 : AppColors.textGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${date.day}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selected ? Colors.white : AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: schedulesForDay.isEmpty
                    ? const Center(
                        child: Text('Tiada kelas pada tarikh ini.', style: TextStyle(color: AppColors.textGrey)),
                      )
                    : ListView.builder(
                        itemCount: schedulesForDay.length,
                        itemBuilder: (context, index) => ScheduleCard(schedule: schedulesForDay[index]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
