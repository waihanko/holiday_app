/// baseUrl : ""
/// supabaseUrl : "localhost:52431"
/// supabaseAnonKey : ""
/// supabaseAuthCallbackUrlHostname : null

class Environment {
  Environment({
    this.baseUrl,
  });

  Environment.fromJson(dynamic json) {
    baseUrl = json['baseUrl'];
  }

  String? baseUrl;

  Environment copyWith({
    String? baseUrl,
  }) =>
      Environment(
        baseUrl: baseUrl ?? this.baseUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['baseUrl'] = baseUrl;
    return map;
  }
}
