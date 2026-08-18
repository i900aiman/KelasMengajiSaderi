/// Model untuk seorang tenaga pengajar (ustaz/ustazah).
class TeacherModel {
  final String id;
  final String name;
  final List<String> subjects; // cth: ["Asas Iqra'", "Kanak-Kanak"]
  final int yearsExperience;
  final int studentsCount;
  final double rating;
  final String badge; // cth: "Guru Berpengalaman"
  final String about;
  final List<TeacherClass> classesHandled;
  final String? photoUrl; // guna placeholder jika null

  const TeacherModel({
    required this.id,
    required this.name,
    required this.subjects,
    required this.yearsExperience,
    required this.studentsCount,
    required this.rating,
    required this.badge,
    required this.about,
    required this.classesHandled,
    this.photoUrl,
  });
}

class TeacherClass {
  final String programId;
  final String title;
  final String ageOrLevel;
  final String day;
  final String time;

  const TeacherClass({
    required this.programId,
    required this.title,
    required this.ageOrLevel,
    required this.day,
    required this.time,
  });
}



/// A teacher (ustaz/ustazah) shown at the top of the Jadual page.
class Teacher {
  final String name;
  final String honorific; // "Ustaz" or "Ustazah"
  final String? role; // e.g. "Pengurus"
  final String? photoAsset; // path under assets/images/teachers/, optional

  const Teacher({
    required this.name,
    required this.honorific,
    this.role,
    this.photoAsset,
  });

  String get displayName => '$honorific $name';
}