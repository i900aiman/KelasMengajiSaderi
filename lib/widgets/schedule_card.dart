import 'package:flutter/material.dart';
import '../models/schedule_model.dart';
import '../theme/app_theme.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleModel schedule;
  final VoidCallback? onTap;

  const ScheduleCard({super.key, required this.schedule, this.onTap});

  Color get _statusBg {
    switch (schedule.status) {
      case ScheduleStatus.tersedia:
        return AppColors.statusAvailableBg;
      case ScheduleStatus.hampirPenuh:
        return AppColors.statusAlmostFullBg;
      case ScheduleStatus.penuh:
        return AppColors.statusFullBg;
    }
  }

  Color get _statusText {
    switch (schedule.status) {
      case ScheduleStatus.tersedia:
        return AppColors.statusAvailableText;
      case ScheduleStatus.hampirPenuh:
        return AppColors.statusAlmostFullText;
      case ScheduleStatus.penuh:
        return AppColors.statusFullText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: schedule.iconBackground,
                child: Icon(schedule.icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            schedule.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        Text(
                          schedule.time,
                          style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.person_outline_rounded, size: 14, color: AppColors.textGrey),
                        const SizedBox(width: 4),
                        Text(schedule.teacher, style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.place_outlined, size: 14, color: AppColors.textGrey),
                        const SizedBox(width: 4),
                        Text(schedule.location, style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: _statusBg, borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          schedule.status.label,
                          style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: _statusText),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
