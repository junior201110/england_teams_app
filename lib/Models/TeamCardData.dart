class TeamCardData {
  final String name;
  final String extra;
  final String image;

  TeamCardData({this.name, this.extra, this.image});

  factory TeamCardData.fromJson(Map<String, dynamic> json) {
    int founded = json['founded'];
    return TeamCardData(
        name: json['name'], extra: "Fundado em $founded", image: json['logo']);
  }
}
