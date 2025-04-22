class HistoryModel {
  final String companyImage;
  final String companyName;
  final DateTime date;
  final String jobName;
  final String process;
  final String id;

  HistoryModel({
    required this.id,
    required this.companyImage,
    required this.companyName,
    required this.date,
    required this.jobName,
    required this.process,
  });

  HistoryModel copyWith({
    String? companyImage,
    String? companyName,
    DateTime? date,
    String? jobName,
    String? process,
  }) => HistoryModel(
    id:  id,
    companyImage: companyImage ?? this.companyImage,
    companyName: companyName ?? this.companyName,
    date: date ?? this.date,
    jobName: jobName ?? this.jobName,
    process: process ?? this.process,
  );

  factory HistoryModel.fromJson(
    Map<String, dynamic> json,
  ) => HistoryModel(
    id: json["id"],
    companyImage: json["companyImage"],
    companyName: json["companyName"],
    date: DateTime.parse(json["date"]),
    jobName: json["jobName"],
    process: json["process"],
  );

  Map<String, dynamic> toJson() => {
    "companyImage": companyImage,
    "companyName": companyName,
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "jobName": jobName,
    "process": process,
  };
}
