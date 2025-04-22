
class ExperienceModel {
    final String companyName;
    final String period;
    final String position;
    final String responsibility;

    ExperienceModel({
        required this.companyName,
        required this.period,
        required this.position,
        required this.responsibility,
    });

    ExperienceModel copyWith({
        String? companyName,
        String? period,
        String? position,
        String? responsibility,
    }) => 
        ExperienceModel(
            companyName: companyName ?? this.companyName,
            period: period ?? this.period,
            position: position ?? this.position,
            responsibility: responsibility ?? this.responsibility,
        );

    factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
        companyName: json["companyName"],
        period: json["period"],
        position: json["position"],
        responsibility: json["responsibility"],
    );

    Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "period": period,
        "position": position,
        "responsibility": responsibility,
    };
}
