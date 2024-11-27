import 'dart:convert';

import 'model_video.dart';

class Videos {
  final int? totalAllData;
  final int? totalData;
  final int? limit;
  final int? totalPage;
  final int? currentPage;
  final int? lastPage;
  final int? nextPage;
  final int? previousPage;
  final List<Video>? listVideo;

  Videos({
    this.totalAllData,
    this.totalData,
    this.limit,
    this.totalPage,
    this.currentPage,
    this.lastPage,
    this.nextPage,
    this.previousPage,
    this.listVideo,
  });

  factory Videos.fromRawJson(String str) => Videos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        totalAllData: json["totalAllData"],
        totalData: json["totalData"],
        limit: json["limit"],
        totalPage: json["totalPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        nextPage: json["nextPage"],
        previousPage: json["previousPage"],
        listVideo: json["payload"] == null ? [] : List<Video>.from(json["payload"]!.map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalAllData": totalAllData,
        "totalData": totalData,
        "limit": limit,
        "totalPage": totalPage,
        "currentPage": currentPage,
        "lastPage": lastPage,
        "nextPage": nextPage,
        "previousPage": previousPage,
        "payload": listVideo == null ? [] : List<dynamic>.from(listVideo!.map((x) => x.toJson())),
      };
}
