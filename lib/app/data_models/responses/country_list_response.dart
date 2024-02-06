class CountryListResponse {
  CountryListResponse({
    String? isoCode,
    List<Name>? name,
    List<String>? officialLanguages,
  }) {
    _isoCode = isoCode;
    _name = name;
    _officialLanguages = officialLanguages;
  }

  CountryListResponse.fromJson(dynamic json) {
    _isoCode = json['isoCode'];
    if (json['name'] != null) {
      _name = [];
      json['name'].forEach((v) {
        _name?.add(Name.fromJson(v));
      });
    }
    _officialLanguages = json['officialLanguages'] != null
        ? json['officialLanguages'].cast<String>()
        : [];
  }

  String? _isoCode;
  List<Name>? _name;
  List<String>? _officialLanguages;

  CountryListResponse copyWith({
    String? isoCode,
    List<Name>? name,
    List<String>? officialLanguages,
  }) =>
      CountryListResponse(
        isoCode: isoCode ?? _isoCode,
        name: name ?? _name,
        officialLanguages: officialLanguages ?? _officialLanguages,
      );

  String? get isoCode => _isoCode;

  List<Name>? get name => _name;

  List<String>? get officialLanguages => _officialLanguages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isoCode'] = _isoCode;
    if (_name != null) {
      map['name'] = _name?.map((v) => v.toJson()).toList();
    }
    map['officialLanguages'] = _officialLanguages;
    return map;
  }
}

class Name {
  Name({
    String? language,
    String? text,
  }) {
    _language = language;
    _text = text;
  }

  Name.fromJson(dynamic json) {
    _language = json['language'];
    _text = json['text'];
  }

  String? _language;
  String? _text;

  Name copyWith({
    String? language,
    String? text,
  }) =>
      Name(
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
