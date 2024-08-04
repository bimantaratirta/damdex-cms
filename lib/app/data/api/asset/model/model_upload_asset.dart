import 'dart:convert';

class ModelUploadAsset {
  final String? name;
  final String? type;
  final int? statusCode;
  final Result? result;

  ModelUploadAsset({
    this.name,
    this.type,
    this.statusCode,
    this.result,
  });

  ModelUploadAsset copyWith({
    String? name,
    String? type,
    int? statusCode,
    Result? result,
  }) =>
      ModelUploadAsset(
        name: name ?? this.name,
        type: type ?? this.type,
        statusCode: statusCode ?? this.statusCode,
        result: result ?? this.result,
      );

  factory ModelUploadAsset.fromRawJson(String str) => ModelUploadAsset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelUploadAsset.fromJson(Map<String, dynamic> json) => ModelUploadAsset(
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

  Result({
    this.id,
  });

  Result copyWith({
    String? id,
  }) =>
      Result(
        id: id ?? this.id,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
