import 'dart:convert';

class ModelTokoProvinsi {
  int? totalAllData;
  List<TokoProvinsi>? payload;

  ModelTokoProvinsi({
    this.totalAllData,
    this.payload,
  });

  ModelTokoProvinsi copyWith({
    int? totalAllData,
    List<TokoProvinsi>? payload,
  }) =>
      ModelTokoProvinsi(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelTokoProvinsi.fromRawJson(String str) => ModelTokoProvinsi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTokoProvinsi.fromJson(Map<String, dynamic> json) => ModelTokoProvinsi(
        totalAllData: json["totalAllData"],
        payload:
            json["payload"] == null ? [] : List<TokoProvinsi>.from(json["payload"]!.map((x) => TokoProvinsi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class TokoProvinsi {
  int? idKota;
  int? idProvinsi;
  String? kota;
  String? tipe;
  String? provinsi;
  int? total;

  TokoProvinsi({
    this.idKota,
    this.idProvinsi,
    this.kota,
    this.tipe,
    this.provinsi,
    this.total,
  });

  TokoProvinsi copyWith({
    int? idKota,
    int? idProvinsi,
    String? kota,
    String? tipe,
    String? provinsi,
    int? total,
  }) =>
      TokoProvinsi(
        idKota: idKota ?? this.idKota,
        idProvinsi: idProvinsi ?? this.idProvinsi,
        kota: kota ?? this.kota,
        tipe: tipe ?? this.tipe,
        provinsi: provinsi ?? this.provinsi,
        total: total ?? this.total,
      );

  factory TokoProvinsi.fromRawJson(String str) => TokoProvinsi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokoProvinsi.fromJson(Map<String, dynamic> json) => TokoProvinsi(
        idKota: json["idKota"],
        idProvinsi: json["idProvinsi"],
        kota: json["kota"],
        tipe: json["tipe"],
        provinsi: json["provinsi"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "idKota": idKota,
        "idProvinsi": idProvinsi,
        "kota": kota,
        "tipe": tipe,
        "provinsi": provinsi,
        "total": total,
      };
}
