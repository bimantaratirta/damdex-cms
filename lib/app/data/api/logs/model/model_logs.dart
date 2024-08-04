import 'dart:convert';

class ModelLogs {
  int? totalAllData;
  List<UserLog>? payload;

  ModelLogs({
    this.totalAllData,
    this.payload,
  });

  ModelLogs copyWith({
    int? totalAllData,
    List<UserLog>? payload,
  }) =>
      ModelLogs(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelLogs.fromRawJson(String str) => ModelLogs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLogs.fromJson(Map<String, dynamic> json) => ModelLogs(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<UserLog>.from(json["payload"]!.map((x) => UserLog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class UserLog {
  String? id;
  String? device;
  Map<String, dynamic>? lokasi;
  String? konten;
  String? idKonten;
  String? tipeKonten;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserLog({
    this.id,
    this.device,
    this.lokasi,
    this.konten,
    this.idKonten,
    this.tipeKonten,
    this.createdAt,
    this.updatedAt,
  });

  UserLog copyWith({
    String? id,
    String? device,
    Map<String, dynamic>? lokasi,
    String? konten,
    String? idKonten,
    String? tipeKonten,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserLog(
        id: id ?? this.id,
        device: device ?? this.device,
        lokasi: lokasi ?? this.lokasi,
        konten: konten ?? this.konten,
        idKonten: idKonten ?? this.idKonten,
        tipeKonten: tipeKonten ?? this.tipeKonten,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserLog.fromRawJson(String str) => UserLog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLog.fromJson(Map<String, dynamic> json) => UserLog(
        id: json["id"],
        device: json["device"],
        lokasi: json["lokasi"],
        konten: json["konten"],
        idKonten: json["idKonten"],
        tipeKonten: json["tipeKonten"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "device": device,
        "lokasi": lokasi,
        "konten": konten,
        "idKonten": idKonten,
        "tipeKonten": tipeKonten,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
