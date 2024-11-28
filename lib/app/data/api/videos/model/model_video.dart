import 'dart:convert';

class Video {
  String? id;
  int? index;
  String? judul;
  String? url;
  String? idAsset;
  DateTime? createdAt;
  DateTime? updatedAt;

  Video({
    this.id,
    this.index,
    this.judul,
    this.url,
    this.idAsset,
    this.createdAt,
    this.updatedAt,
  });

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        index: json["index"],
        judul: json["judul"],
        url: json["url"],
        idAsset: json["idAsset"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "judul": judul,
        "url": url,
        "idAsset": idAsset,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
