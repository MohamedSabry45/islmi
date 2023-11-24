/// id : 10
/// name : "إذاعة الزين محمد أحمد"
/// url : "https://backup.qurango.net/radio/alzain_mohammad_ahmad"
/// recent_date : "2020-04-25 13:04:04"

class RadiosData {
  RadiosData({
      this.id, 
      this.name, 
      this.url, 
      this.recentDate,});

  RadiosData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  int? id;
  String? name;
  String? url;
  String? recentDate;
RadiosData copyWith({  int? id,
  String? name,
  String? url,
  String? recentDate,
}) => RadiosData(  id: id ?? this.id,
  name: name ?? this.name,
  url: url ?? this.url,
  recentDate: recentDate ?? this.recentDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }

}