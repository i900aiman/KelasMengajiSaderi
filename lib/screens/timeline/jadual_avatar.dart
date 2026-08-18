import 'package:flutter/material.dart';
import 'package:kelas_mengaji_saderi/models/teacher_model.dart';

/// Horizontal scrollable row of teacher photo circles with name labels,
/// matching the poster header. Falls back to initials if [photoAsset]
/// is missing so the page still looks fine before assets are added.
class TeacherAvatarRow extends StatelessWidget {
  final List<Teacher> teachers;

  const TeacherAvatarRow({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: teachers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final t = teachers[index];
          return _TeacherAvatar(teacher: t);
        },
      ),
    );
  }
}

class _TeacherAvatar extends StatelessWidget {
  final Teacher teacher;
  const _TeacherAvatar({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: const Color(0xFF2A2350),
                backgroundImage: teacher.photoAsset != null
                    ? AssetImage(teacher.photoAsset!)
                    : null,
                child: teacher.photoAsset == null
                    ? Text(
                        teacher.name.substring(0, 1),
                        style: const TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : null,
              ),
              if (teacher.role != null)
                Positioned(
                  bottom: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD24BD8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      teacher.role!,
                      style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${teacher.honorific}\n${teacher.name}',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              height: 1.1,
              shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
            ),
          ),
        ],
      ),
    );
  }
}