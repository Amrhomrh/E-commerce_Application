class CateogryModel {
  String? cateogreyId;
  String? cateogreyName;
  String? cateogreyNameAr;
  String? cateogreyImages;
  String? cateogreyTime;

  CateogryModel(
      {this.cateogreyId,
      this.cateogreyName,
      this.cateogreyNameAr,
      this.cateogreyImages,
      this.cateogreyTime});

  CateogryModel.fromJson(Map<String, dynamic> json) {
    cateogreyId = json["cateogrey_id"];
    cateogreyName = json["cateogrey_name"];
    cateogreyNameAr = json["cateogrey_name_ar"];
    cateogreyImages = json["cateogrey_images"];
    cateogreyTime = json["cateogrey_time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cateogrey_id"] = cateogreyId;
    _data["cateogrey_name"] = cateogreyName;
    _data["cateogrey_name_ar"] = cateogreyNameAr;
    _data["cateogrey_images"] = cateogreyImages;
    _data["cateogrey_time"] = cateogreyTime;
    return _data;
  }
}
