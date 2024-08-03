import 'dart:convert';

class ModelLog {
  String? device;
  Map<String, dynamic>? lokasi;
  String? konten;
  String? idKonten;
  String? tipeKonten;
  String? createdAt;
  String? updatedAt;

  ModelLog({
    this.device,
    this.lokasi,
    this.konten,
    this.idKonten,
    this.tipeKonten,
    this.createdAt,
    this.updatedAt,
  });

  ModelLog copyWith({
    String? device,
    Map<String, dynamic>? lokasi,
    String? konten,
    String? idKonten,
    String? tipeKonten,
    String? createdAt,
    String? updatedAt,
  }) =>
      ModelLog(
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
        device: json["device"],
        lokasi: json["lokasi"],
        konten: json["konten"],
        idKonten: json["idKonten"],
        tipeKonten: json["tipeKonten"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "device": device,
        "lokasi": lokasi,
        "konten": konten,
        "idKonten": idKonten,
        "tipeKonten": tipeKonten,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
