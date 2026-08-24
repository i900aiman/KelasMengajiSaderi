import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/jadual_entry_model.dart';

/// Which side of the ribbon has the pointed "arrow" notch.
enum RibbonPoint { left, right }

/// Recreates the flag/badge shape used for each teacher's name
/// on the poster. Both ends are now fully rounded (no pointed notch).
/// [point] is kept for padding purposes (which side has more breathing room).
class RibbonSlot extends StatelessWidget {
  final JadualSlot slot;
  final RibbonPoint point;

  const RibbonSlot({super.key, required this.slot, required this.point});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _RibbonClipper(),
      child: Container(
        height: 40,
        color: slot.color,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          slot.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: slot.textColor,
            fontWeight: FontWeight.w700,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
  const _RibbonClipper();

  static const double _round = 8;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    // Fully rounded rectangle — all four corners use the same radius.
    path.moveTo(_round, 0);
    path.lineTo(w - _round, 0);
    path.quadraticBezierTo(w, 0, w, _round);
    path.lineTo(w, h - _round);
    path.quadraticBezierTo(w, h, w - _round, h);
    path.lineTo(_round, h);
    path.quadraticBezierTo(0, h, 0, h - _round);
    path.lineTo(0, _round);
    path.quadraticBezierTo(0, 0, _round, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}