import 'dart:convert';

class ModelUsage {
  String? id;
  dynamic idAsset;
  String? judul;
  String? deskripsi;
  bool? isAktif;
  List<Tipe>? listTipe;
  List<UsageArtikel>? listArtikel;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModelUsage({
    this.id,
    this.idAsset,
    this.judul,
    this.deskripsi,
    this.isAktif,
    this.listTipe,
    this.listArtikel,
    this.createdAt,
    this.updatedAt,
  });

  ModelUsage copyWith({
    String? id,
    dynamic idAsset,
    String? judul,
    String? deskripsi,
    bool? isAktif,
    List<Tipe>? listTipe,
    List<UsageArtikel>? listArtikel,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ModelUsage(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        isAktif: isAktif ?? this.isAktif,
        listTipe: listTipe ?? this.listTipe,
        listArtikel: listArtikel ?? this.listArtikel,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ModelUsage.fromRawJson(String str) => ModelUsage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelUsage.fromJson(Map<String, dynamic> json) => ModelUsage(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        isAktif: json["isAktif"],
        listTipe: json["listTipe"] == null ? [] : List<Tipe>.from(json["listTipe"]!.map((x) => Tipe.fromJson(x))),
        listArtikel: json["listArtikel"] == null
            ? []
            : List<UsageArtikel>.from(json["listArtikel"]!.map((x) => UsageArtikel.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "deskripsi": deskripsi,
        "isAktif": isAktif,
        "listTipe": listTipe == null ? [] : List<dynamic>.from(listTipe!.map((x) => x.toJson())),
        "listArtikel": listArtikel == null ? [] : List<dynamic>.from(listArtikel!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class UsageArtikel {
  String? id;
  dynamic idAsset;
  String? judul;
  String? body;
  bool? isAktif;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? idArtikel;
  int? index;

  UsageArtikel({
    this.id,
    this.idAsset,
    this.judul,
    this.body,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
    this.idArtikel,
    this.index,
  });

  UsageArtikel copyWith({
    String? id,
    dynamic idAsset,
    String? judul,
    String? body,
    bool? isAktif,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? idArtikel,
    int? index,
  }) =>
      UsageArtikel(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        body: body ?? this.body,
        isAktif: isAktif ?? this.isAktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        idArtikel: idArtikel ?? this.idArtikel,
        index: index ?? this.index,
      );

  factory UsageArtikel.fromRawJson(String str) => UsageArtikel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsageArtikel.fromJson(Map<String, dynamic> json) => UsageArtikel(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        body: json["body"],
        isAktif: json["isAktif"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        idArtikel: json["idArtikel"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "body": body,
        "isAktif": isAktif,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "idArtikel": idArtikel,
        "index": index,
      };
}

class Tipe {
  String? id;
  int? index;
  String? judul;
  String? body;

  Tipe({
    this.id,
    this.index,
    this.judul,
    this.body,
  });

  Tipe copyWith({
    String? id,
    int? index,
    String? judul,
    String? body,
  }) =>
      Tipe(
        id: id ?? this.id,
        index: index ?? this.index,
        judul: judul ?? this.judul,
        body: body ?? this.body,
      );

  factory Tipe.fromRawJson(String str) => Tipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tipe.fromJson(Map<String, dynamic> json) => Tipe(
        id: json["id"],
        index: json["index"],
        judul: json["judul"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "judul": judul,
        "body": body,
      };
}
