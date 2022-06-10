class ProjectExp {
  String? title;
  String? logo;
  String? about;
  var color;
  String? desc;
  bool? isExpand;
  String? androidUrl;
  String? iosUrl;
  ProjectExp(
      {this.title,
      this.color,
      this.about,
      this.desc,
      this.logo,
      this.isExpand,
      this.androidUrl,
      this.iosUrl});

  factory ProjectExp.fromJson(Map<String, dynamic> json) => ProjectExp(
      title: json["title"] == null ? null : json["title"],
      logo: json["logo"] == null ? null : json["logo"],
      about: json["about"] == null ? null : json["about"],
      desc: json["desc"] == null ? null : json["desc"],
      color: json["color"] == null ? null : json["color"],
      androidUrl: json["androidUrl"] == null ? null : json["androidUrl"],
      iosUrl: json["iosUrl"] == null ? null : json["iosUrl"],
      isExpand: json["isExpand"] == null ? null : json["isExpand"]);
}
