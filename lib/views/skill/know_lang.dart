class KnowledgeLang {
  String name;
  String level;
  String icon;
  int skills;
  KnowledgeLang({this.icon, this.level, this.name, this.skills});

  factory KnowledgeLang.fromJson(Map<String, dynamic> json) => KnowledgeLang(
    name: json["name"] == null ? null : json["name"],
    level: json["level"] == null ? null : json["level"],
    icon: json["icon"] == null ? null : json["icon"],
    skills: json["skills"] == null ? null : json["skills"],
  );
}

