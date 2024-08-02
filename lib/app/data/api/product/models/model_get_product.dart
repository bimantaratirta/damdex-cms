import 'dart:convert';

class ModelGetProduct {
  String? id;
  String? idAsset;
  String? judul;
  String? deskripsi;
  bool? isAktif;
  List<Fitur>? listFitur;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModelGetProduct({
    this.id,
    this.idAsset,
    this.judul,
    this.deskripsi,
    this.isAktif,
    this.listFitur,
    this.createdAt,
    this.updatedAt,
  });

  ModelGetProduct copyWith({
    String? id,
    String? idAsset,
    String? judul,
    String? deskripsi,
    bool? isAktif,
    List<Fitur>? listFitur,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ModelGetProduct(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        isAktif: isAktif ?? this.isAktif,
        listFitur: listFitur ?? this.listFitur,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ModelGetProduct.fromRawJson(String str) => ModelGetProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelGetProduct.fromJson(Map<String, dynamic> json) => ModelGetProduct(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        isAktif: json["isAktif"],
        listFitur: json["listFitur"] == null ? [] : List<Fitur>.from(json["listFitur"]!.map((x) => Fitur.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "deskripsi": deskripsi,
        "isAktif": isAktif,
        "listFitur": listFitur == null ? [] : List<dynamic>.from(listFitur!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Fitur {
  String? id;
  int? index;
  String? judul;
  String? body;

  Fitur({
    this.id,
    this.index,
    this.judul,
    this.body,
  });

  Fitur copyWith({
    String? id,
    int? index,
    String? judul,
    String? body,
  }) =>
      Fitur(
        id: id ?? this.id,
        index: index ?? this.index,
        judul: judul ?? this.judul,
        body: body ?? this.body,
      );

  factory Fitur.fromRawJson(String str) => Fitur.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fitur.fromJson(Map<String, dynamic> json) => Fitur(
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
