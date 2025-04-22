
class SkillsModel {
    final String hardSkill;
    final String softSkill;

    SkillsModel({
        required this.hardSkill,
        required this.softSkill,
    });

    SkillsModel copyWith({
        String? hardSkill,
        String? softSkill,
    }) => 
        SkillsModel(
            hardSkill: hardSkill ?? this.hardSkill,
            softSkill: softSkill ?? this.softSkill,
        );

    factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
        hardSkill: json["hardSkill"],
        softSkill: json["softSkill"],
    );

    Map<String, dynamic> toJson() => {
        "hardSkill": hardSkill,
        "softSkill": softSkill,
    };
}