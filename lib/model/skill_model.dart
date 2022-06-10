class SkillModel {
  String? name;
  String? level;
  String? icon;
  int? skills;
  SkillModel({this.icon, this.level, this.name, this.skills});

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        name: json["name"] == null ? null : json["name"],
        level: json["level"] == null ? null : json["level"],
        icon: json["icon"] == null ? null : json["icon"],
        skills: json["skills"] == null ? null : json["skills"],
      );
}
