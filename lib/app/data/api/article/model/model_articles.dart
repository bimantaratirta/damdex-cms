import 'dart:convert';

class ModelArticles {
  int? totalAllData;
  List<Artikel>? payload;

  ModelArticles({
    this.totalAllData,
    this.payload,
  });

  ModelArticles copyWith({
    int? totalAllData,
    List<Artikel>? payload,
  }) =>
      ModelArticles(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelArticles.fromRawJson(String str) => ModelArticles.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelArticles.fromJson(Map<String, dynamic> json) => ModelArticles(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<Artikel>.from(json["payload"]!.map((x) => Artikel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Artikel {
  String? id;
  String? idAsset;
  String? judul;
  String? body;
  bool? isAktif;
  DateTime? createdAt;
  DateTime? updatedAt;

  Artikel({
    this.id,
    this.idAsset,
    this.judul,
    this.body,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
  });

  Artikel copyWith({
    String? id,
    String? idAsset,
    String? judul,
    String? body,
    bool? isAktif,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Artikel(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        body: body ?? this.body,
        isAktif: isAktif ?? this.isAktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Artikel.fromRawJson(String str) => Artikel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        id: json["id"],
        idAsset: json["idAsset"],
        judul: json["judul"],
        body: json["body"],
        isAktif: json["isAktif"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idAsset": idAsset,
        "judul": judul,
        "body": body,
        "isAktif": isAktif,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
