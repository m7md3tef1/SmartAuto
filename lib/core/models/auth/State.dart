class States {
  States({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  States.fromJson(dynamic json) {
    id = json['id'];
    nameAr = json['name'];
    nameEn = json['name,'];
  }
  int? id;
  String? nameAr;
  String? nameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = nameAr;
    map['name,'] = nameEn;
    return map;
  }
}
