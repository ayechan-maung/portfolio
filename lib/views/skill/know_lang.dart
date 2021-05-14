class KnowledgeLang {
  String name;
  String level;
  String icon;
  int skill;
  KnowledgeLang({this.icon, this.level, this.name, this.skill});

  factory KnowledgeLang.fromJson(Map<String, dynamic> json) => KnowledgeLang(
        name: json["name"] == null ? null : json["name"],
        level: json["level"] == null ? null : json["level"],
        icon: json["icon"] == null ? null : json["icon"],
        skill: json["skill"] == null ? null : json["skill"],
      );
}
