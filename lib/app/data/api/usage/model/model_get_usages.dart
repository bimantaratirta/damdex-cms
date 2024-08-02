import 'dart:convert';

class ModelGetUsages {
  int? totalAllData;
  List<Usage>? payload;

  ModelGetUsages({
    this.totalAllData,
    this.payload,
  });

  ModelGetUsages copyWith({
    int? totalAllData,
    List<Usage>? payload,
  }) =>
      ModelGetUsages(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelGetUsages.fromRawJson(String str) => ModelGetUsages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelGetUsages.fromJson(Map<String, dynamic> json) => ModelGetUsages(
        totalAllData: json["totalAllData"],
        payload: json["payload"] == null ? [] : List<Usage>.from(json["payload"]!.map((x) => Usage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Usage {
  String? id;
  dynamic idAsset;
  String? judul;
  String? deskripsi;
  bool? isAktif;
  DateTime? createdAt;
  DateTime? updatedAt;

  Usage({
    this.id,
    this.idAsset,
    this.judul,
    this.deskripsi,
    this.isAktif,
    this.createdAt,
    this.updatedAt,
  });

  Usage copyWith({
    String? id,
    dynamic idAsset,
    String? judul,
    String? deskripsi,
    bool? isAktif,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Usage(
        id: id ?? this.id,
        idAsset: idAsset ?? this.idAsset,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        isAktif: isAktif ?? this.isAktif,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Usage.fromRawJson(String str) => Usage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
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
