import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/jadual_entry_model.dart';
import 'package:kelas_mengaji_saderi/theme/app_theme.dart';
import 'ribbon_slot.dart';

/// One navy "brick" card for a single day, e.g. Isnin.
class JadualDayCard extends StatelessWidget {
  final JadualDay day;

  const JadualDayCard({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: JadualTheme.cardNavy,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: JadualTheme.cardBorderGold, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    for (final slot in day.bilikBacaan)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: RibbonSlot(slot: slot, point: RibbonPoint.right),
                      ),
                  ],
                ),
              ),
              _DayBadge(label: day.day),
              Expanded(
                child: Column(
                  children: [
                    for (final slot in day.bilikServaguna)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: RibbonSlot(slot: slot, point: RibbonPoint.left),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayBadge extends StatelessWidget {
  final String label;
  const _DayBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: JadualTheme.dayBadgeBlack,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}