class HolidayListResponse {
  HolidayListResponse({
    String? id,
    String? startDate,
    String? endDate,
    String? type,
    List<HolidayName>? name,
    bool? nationwide,
  }) {
    _id = id;
    _startDate = startDate;
    _endDate = endDate;
    _type = type;
    _name = name;
    _nationwide = nationwide;
  }

  HolidayListResponse.fromJson(dynamic json) {
    _id = json['id'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _type = json['type'];
    if (json['name'] != null) {
      _name = [];
      json['name'].forEach((v) {
        _name?.add(HolidayName.fromJson(v));
      });
    }
    _nationwide = json['nationwide'];
  }

  String? _id;
  String? _startDate;
  String? _endDate;
  String? _type;
  List<HolidayName>? _name;
  bool? _nationwide;

  HolidayListResponse copyWith({
    String? id,
    String? startDate,
    String? endDate,
    String? type,
    List<HolidayName>? name,
    bool? nationwide,
  }) =>
      HolidayListResponse(
        id: id ?? _id,
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        type: type ?? _type,
        name: name ?? _name,
        nationwide: nationwide ?? _nationwide,
      );

  String? get id => _id;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get type => _type;

  List<HolidayName>? get name => _name;

  bool? get nationwide => _nationwide;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['type'] = _type;
    if (_name != null) {
      map['name'] = _name?.map((v) => v.toJson()).toList();
    }
    map['nationwide'] = _nationwide;
    return map;
  }
}

class HolidayName {
  HolidayName({
    String? language,
    String? text,
  }) {
    _language = language;
    _text = text;
  }

  HolidayName.fromJson(dynamic json) {
    _language = json['language'];
    _text = json['text'];
  }

  String? _language;
  String? _text;

  HolidayName copyWith({
    String? language,
    String? text,
  }) =>
      HolidayName(
        language: language ?? _language,
        text: text ?? _text,
      );

  String? get language => _language;

  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = _language;
    map['text'] = _text;
    return map;
  }
}
