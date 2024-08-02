import 'dart:convert';

class ModelTokoKota {
  String? idKota;
  int? idProvinsi;
  String? kota;
  String? tipe;
  String? provinsi;
  int? total;
  List<Toko>? listToko;

  ModelTokoKota({
    this.idKota,
    this.idProvinsi,
    this.kota,
    this.tipe,
    this.provinsi,
    this.total,
    this.listToko,
  });

  ModelTokoKota copyWith({
    String? idKota,
    int? idProvinsi,
    String? kota,
    String? tipe,
    String? provinsi,
    int? total,
    List<Toko>? listToko,
  }) =>
      ModelTokoKota(
        idKota: idKota ?? this.idKota,
        idProvinsi: idProvinsi ?? this.idProvinsi,
        kota: kota ?? this.kota,
        tipe: tipe ?? this.tipe,
        provinsi: provinsi ?? this.provinsi,
        total: total ?? this.total,
        listToko: listToko ?? this.listToko,
      );

  factory ModelTokoKota.fromRawJson(String str) => ModelTokoKota.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTokoKota.fromJson(Map<String, dynamic> json) => ModelTokoKota(
        idKota: json["idKota"],
        idProvinsi: json["idProvinsi"],
        kota: json["kota"],
        tipe: json["tipe"],
        provinsi: json["provinsi"],
        total: json["total"],
        listToko: json["listToko"] == null ? [] : List<Toko>.from(json["listToko"]!.map((x) => Toko.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idKota": idKota,
        "idProvinsi": idProvinsi,
        "kota": kota,
        "tipe": tipe,
        "provinsi": provinsi,
        "total": total,
        "listToko": listToko == null ? [] : List<dynamic>.from(listToko!.map((x) => x.toJson())),
      };
}

class Toko {
  String? id;
  int? idKota;
  String? nama;
  String? detail;
  String? noHp;
  String? tipe;
  DateTime? createdAt;
  DateTime? updatedAt;

  Toko({
    this.id,
    this.idKota,
    this.nama,
    this.detail,
    this.noHp,
    this.tipe,
    this.createdAt,
    this.updatedAt,
  });

  Toko copyWith({
    String? id,
    int? idKota,
    String? nama,
    String? detail,
    String? noHp,
    String? tipe,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Toko(
        id: id ?? this.id,
        idKota: idKota ?? this.idKota,
        nama: nama ?? this.nama,
        detail: detail ?? this.detail,
        noHp: noHp ?? this.noHp,
        tipe: tipe ?? this.tipe,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Toko.fromRawJson(String str) => Toko.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        id: json["id"],
        idKota: json["idKota"],
        nama: json["nama"],
        detail: json["detail"],
        noHp: json["noHp"],
        tipe: json["tipe"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idKota": idKota,
        "nama": nama,
        "detail": detail,
        "noHp": noHp,
        "tipe": tipe,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
