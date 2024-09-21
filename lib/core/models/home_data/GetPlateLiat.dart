/// Plate_No : "11/55540"
/// fa_DSC_En : "Altima 2.5 Alloy wheel 2012"

class GetPlateLiat {
  GetPlateLiat({
    String? plateNo,
    String? faDSCEn,
  }) {
    _plateNo = plateNo;
    _faDSCEn = faDSCEn;
  }

  GetPlateLiat.fromJson(dynamic json) {
    _plateNo = json['Plate_No'];
    _faDSCEn = json['fa_DSC_En'];
  }
  String? _plateNo;
  String? _faDSCEn;
  GetPlateLiat copyWith({
    String? plateNo,
    String? faDSCEn,
  }) =>
      GetPlateLiat(
        plateNo: plateNo ?? _plateNo,
        faDSCEn: faDSCEn ?? _faDSCEn,
      );
  String? get plateNo => _plateNo;
  String? get faDSCEn => _faDSCEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Plate_No'] = _plateNo;
    map['fa_DSC_En'] = _faDSCEn;
    return map;
  }
}
