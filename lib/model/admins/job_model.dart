class JobModel {
  final String companyId;
  final String id;
  final String jobInfo;
  final Map<String, dynamic> comment;
  final String companyImage;
  final Map<String, dynamic> grade;
  final String jobName;
  final String jobTile;
  final String salary;
  final String shortLocation;
  final DateTime time;

  JobModel({
    required this.jobInfo,
    this.companyId = "0",
    this.id = "0",
    this.comment = const {},
    required this.companyImage,
    this.grade = const {},
    required this.jobName,
    required this.jobTile,
    required this.salary,
    required this.shortLocation,
    required this.time,
  });

  JobModel copyWith({
    String? jobInfo,
    String? companyImage,
    String? jobName,
    String? jobTile,
    String? salary,
    String? shortLocation,
    DateTime? time,
  }) => JobModel(
    jobInfo: jobInfo ?? this.jobInfo,
    companyId: companyId,
    id: id,
    comment: comment,
    companyImage: companyImage ?? this.companyImage,
    grade: grade,
    jobName: jobName ?? this.jobName,
    jobTile: jobTile ?? this.jobTile,
    salary: salary ?? this.salary,
    shortLocation: shortLocation ?? this.shortLocation,
    time: time ?? this.time,
  );

  factory JobModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return JobModel(
      jobInfo: json["jobInfo"],
      companyId: json["companyId"] ?? "0",
      id: json["id"],
      comment: json["comment"] ?? {},
      companyImage: json["companyImage"],
      grade: json["grade"] ?? {},
      jobName: json["jobName"],
      jobTile: json["jobTile"],
      salary: json["salary"],
      shortLocation: json["shortLocation"],
      time: DateTime.parse(json["time"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "jobInfo": jobInfo,
    "comment": comment,
    "companyImage": companyImage,
    "grade": grade,
    "jobName": jobName,
    "jobTile": jobTile,
    "salary": salary,
    "shortLocation": shortLocation,
    "time":
        "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
  };
  @override
  String toString() {
    return 'JobModel('
        'id:  $id'
        'comment: $comment, '
        'companyImage: $companyImage, '
        'grade: $grade, '
        'jobName: $jobName, '
        'jobTile: $jobTile, '
        'salary: $salary, '
        'shortLocation: $shortLocation, '
        'time: $time'
        ')';
  }
}
