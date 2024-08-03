import 'dart:convert';

class ModelSettings {
  int? totalAllData;
  List<Payload>? payload;

  ModelSettings({
    this.totalAllData,
    this.payload,
  });

  ModelSettings copyWith({
    int? totalAllData,
    List<Payload>? payload,
  }) =>
      ModelSettings(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelSettings.fromRawJson(String str) => ModelSettings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSettings.fromJson(Map<String, dynamic> json) => ModelSettings(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  String? id;
  String? kode;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;

  Payload({
    this.id,
    this.kode,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  Payload copyWith({
    String? id,
    String? kode,
    String? value,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Payload(
        id: id ?? this.id,
        kode: kode ?? this.kode,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        kode: json["kode"],
        value: json["value"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "value": value,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
