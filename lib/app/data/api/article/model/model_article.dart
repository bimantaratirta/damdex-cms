import 'dart:convert';

class ModelArticle {
  String? id;
  String? idAsset;
  int? index;
  String? judul;
  String? body;
  bool? isAktif;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModelArticle({
    this.id,
    this.idAsset,
    this.index,
    this.judul,
    this.body,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
  });

  factory ModelArticle.fromRawJson(String str) => ModelArticle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelArticle.fromJson(Map<String, dynamic> json) => ModelArticle(
        id: json["id"],
        idAsset: json["idAsset"],
        index: json["index"],
        judul: json["judul"],
        body: json["body"],
        isAktif: json["isAktif"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "index": index,
        "judul": judul,
        "body": body,
        "isAktif": isAktif,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
