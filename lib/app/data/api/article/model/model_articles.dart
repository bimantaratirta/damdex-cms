import 'dart:convert';

import 'model_article.dart';

class ModelArticles {
  int? totalAllData;
  List<ModelArticle>? payload;

  ModelArticles({
    this.totalAllData,
    this.payload,
  });

  ModelArticles copyWith({
    int? totalAllData,
    List<ModelArticle>? payload,
  }) =>
      ModelArticles(
        totalAllData: totalAllData ?? this.totalAllData,
        payload: payload ?? this.payload,
      );

  factory ModelArticles.fromRawJson(String str) => ModelArticles.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelArticles.fromJson(Map<String, dynamic> json) => ModelArticles(
        totalAllData: json["totalAllData"],
        payload:
            json["payload"] == null ? [] : List<ModelArticle>.from(json["payload"]!.map((x) => ModelArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}
