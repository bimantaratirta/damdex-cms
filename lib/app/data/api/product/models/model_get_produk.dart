import 'dart:convert';

class ModelGetProduk {
  final int? totalAllData;
  final List<Produk>? payload;

  ModelGetProduk({
    this.totalAllData,
    this.payload,
  });

  ModelGetProduk copyWith({
    int? totalAllData,
    List<Produk>? payload,
  }) =>
      ModelGetProduk(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelGetProduk.fromRawJson(String str) => ModelGetProduk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelGetProduk.fromJson(Map<String, dynamic> json) => ModelGetProduk(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<Produk>.from(json["payload"]!.map((x) => Produk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Produk {
  final String? id;
  final String? idAsset;
  final String? judul;
  final String? deskripsi;
  final bool? isAktif;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Produk({
    this.id,
    this.idAsset,
    this.judul,
    this.deskripsi,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
  });

  Produk copyWith({
    String? id,
    String? idAsset,
    String? judul,
    String? deskripsi,
    bool? isAktif,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Produk(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        isAktif: isAktif ?? this.isAktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Produk.fromRawJson(String str) => Produk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        isAktif: json["isAktif"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "deskripsi": deskripsi,
        "isAktif": isAktif,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
