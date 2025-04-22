class EducationModel {
  final String degree;
  final String duration;
  final String educationName;

  EducationModel({
    required this.degree,
    required this.duration,
    required this.educationName,
  });

  EducationModel copyWith({
    String? degree,
    String? duration,
    String? educationName,
  }) => EducationModel(
    degree: degree ?? this.degree,
    duration: duration ?? this.duration,
    educationName: educationName ?? this.educationName,
  );

  factory EducationModel.fromJson(
    Map<String, dynamic> json,
  ) => EducationModel(
    degree: json["degree"],
    duration: json["duration"],
    educationName: json["educationName"],
  );

  Map<String, dynamic> toJson() => {
    "degree": degree,
    "duration": duration,
    "educationName": educationName,
  };
}
