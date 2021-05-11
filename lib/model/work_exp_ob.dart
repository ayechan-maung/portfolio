class WorkExp {
  String title;
  String role;
  String year;
  String image;
  bool isExpand;
  WorkExp({this.title, this.year, this.image, this.role, this.isExpand});

  factory WorkExp.fromJson(Map<String, dynamic> json) => WorkExp(
      title: json["title"] == null ? null : json["title"],
      role: json["role"] == null ? null : json["role"],
      year: json["year"] == null ? null : json["year"],
      image: json["image"] == null ? null : json["image"]);
}
