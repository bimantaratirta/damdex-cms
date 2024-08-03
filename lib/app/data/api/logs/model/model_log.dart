import 'dart:convert';

class ModelLog {
  String? id;
  String? device;
  Map<String, dynamic>? lokasi;
  String? konten;
  String? idKonten;
  String? tipeKonten;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModelLog({
    this.id,
    this.device,
    this.lokasi,
    this.konten,
    this.idKonten,
    this.tipeKonten,
    this.createdAt,
    this.updatedAt,
  });

  ModelLog copyWith({
    String? id,
    String? device,
    Map<String, dynamic>? lokasi,
    String? konten,
    String? idKonten,
    String? tipeKonten,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ModelLog(
        id: id ?? this.id,
        device: device ?? this.device,
        lokasi: lokasi ?? this.lokasi,
        konten: konten ?? this.konten,
        idKonten: idKonten ?? this.idKonten,
        tipeKonten: tipeKonten ?? this.tipeKonten,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ModelLog.fromRawJson(String str) => ModelLog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLog.fromJson(Map<String, dynamic> json) => ModelLog(
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
