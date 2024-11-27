import 'dart:convert';

class ModelAbout {
  String? judul;
  String? idAsset;
  String? body;
  String? createdAt;
  String? updatedAt;

  ModelAbout({
    this.judul,
    this.idAsset,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory ModelAbout.fromRawJson(String str) => ModelAbout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelAbout.fromJson(Map<String, dynamic> json) => ModelAbout(
        judul: json["judul"],
        idAsset: json["idAsset"],
        body: json["body"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "idAsset": idAsset,
        "body": body,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
