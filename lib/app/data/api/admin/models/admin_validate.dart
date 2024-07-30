import 'dart:convert';

class ModelAdminValidate {
  final String? name;
  final String? type;
  final int? statusCode;
  final Result? result;

  ModelAdminValidate({
    this.name,
    this.type,
    this.statusCode,
    this.result,
  });

  ModelAdminValidate copyWith({
    String? name,
    String? type,
    int? statusCode,
    Result? result,
  }) =>
      ModelAdminValidate(
        name: name ?? this.name,
        type: type ?? this.type,
        statusCode: statusCode ?? this.statusCode,
        result: result ?? this.result,
      );

  factory ModelAdminValidate.fromRawJson(String str) => ModelAdminValidate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelAdminValidate.fromJson(Map<String, dynamic> json) => ModelAdminValidate(
        name: json["name"],
        type: json["type"],
        statusCode: json["statusCode"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "statusCode": statusCode,
        "result": result?.toJson(),
      };
}

class Result {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? nama;
  final String? username;

  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.username,
  });

  Result copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nama,
    String? username,
  }) =>
      Result(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        nama: nama ?? this.nama,
        username: username ?? this.username,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        nama: json["nama"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "nama": nama,
        "username": username,
      };
}
