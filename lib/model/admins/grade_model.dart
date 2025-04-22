
class GradeModel {
    final String contact;
    final int grade;

    GradeModel({
        required this.contact,
        required this.grade,
    });

    GradeModel copyWith({
        String? contact,
        int? grade,
    }) => 
        GradeModel(
            contact: contact ?? this.contact,
            grade: grade ?? this.grade,
        );

    factory GradeModel.fromJson(Map<String, dynamic> json) => GradeModel(
        contact: json["contact"],
        grade: json["grade"],
    );

    Map<String, dynamic> toJson() => {
        "contact": contact,
        "grade": grade,
    };
}
