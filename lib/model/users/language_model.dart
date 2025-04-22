
class LanguageModel {
    final String lanGrade;
    final String lanName;

    LanguageModel({
        required this.lanGrade,
        required this.lanName,
    });

    LanguageModel copyWith({
        String? lanGrade,
        String? lanName,
    }) => 
        LanguageModel(
            lanGrade: lanGrade ?? this.lanGrade,
            lanName: lanName ?? this.lanName,
        );

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        lanGrade: json["lanGrade"],
        lanName: json["lanName"],
    );

    Map<String, dynamic> toJson() => {
        "lanGrade": lanGrade,
        "lanName": lanName,
    };
}
