import 'dart:convert';

class ModelArticle {
  String? id;
  String? idAsset;
  String? judul;
  String? body;
  bool? isAktif;
  String? createdAt;
  String? updatedAt;

  ModelArticle({
    this.id,
    this.idAsset,
    this.judul,
    this.body,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
  });

  ModelArticle copyWith({
    String? id,
    String? idAsset,
    String? judul,
    String? body,
    bool? isAktif,
    String? createdAt,
    String? updatedAt,
  }) =>
      ModelArticle(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        body: body ?? this.body,
        isAktif: isAktif ?? this.isAktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ModelArticle.fromRawJson(String str) => ModelArticle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelArticle.fromJson(Map<String, dynamic> json) => ModelArticle(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        body: json["body"],
        isAktif: json["isAktif"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "body": body,
        "isAktif": isAktif,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
