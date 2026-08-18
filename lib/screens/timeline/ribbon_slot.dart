import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/jadual_entry_model.dart';

/// Which side of the ribbon has the pointed "arrow" notch.
enum RibbonPoint { left, right }

/// Recreates the arrow-flag ribbon shape used for each teacher's name
/// on the poster. [point] controls which side the triangular tip sits on,
/// so left-column (Bilik Bacaan) and right-column (Bilik Serbaguna) ribbons
/// can point toward the day badge in the middle.
class RibbonSlot extends StatelessWidget {
  final JadualSlot slot;
  final RibbonPoint point;

  const RibbonSlot({super.key, required this.slot, required this.point});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _RibbonClipper(point: point),
      child: Container(
        height: 40,
        color: slot.color,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: point == RibbonPoint.left ? 20 : 14,
          right: point == RibbonPoint.right ? 20 : 14,
        ),
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
  final RibbonPoint point;
  const _RibbonClipper({required this.point});

  static const double _notch = 12;
  static const double _round = 8;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    if (point == RibbonPoint.right) {
      // Rounded corners on the left, triangular tip on the right.
      path.moveTo(_round, 0);
      path.lineTo(w - _notch, 0);
      path.lineTo(w, h / 2);
      path.lineTo(w - _notch, h);
      path.lineTo(_round, h);
      path.quadraticBezierTo(0, h, 0, h - _round);
      path.lineTo(0, _round);
      path.quadraticBezierTo(0, 0, _round, 0);
    } else {
      // Rounded corners on the right, triangular tip on the left.
      path.moveTo(_notch, 0);
      path.lineTo(w - _round, 0);
      path.quadraticBezierTo(w, 0, w, _round);
      path.lineTo(w, h - _round);
      path.quadraticBezierTo(w, h, w - _round, h);
      path.lineTo(_notch, h);
      path.lineTo(0, h / 2);
      path.close();
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}