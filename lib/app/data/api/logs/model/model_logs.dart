import 'dart:convert';

class ModelLogs {
  int? totalAllData;
  int? totalData;
  int? limit;
  int? totalPage;
  int? currentPage;
  int? lastPage;
  int? nextPage;
  int? previousPage;
  List<UserLog>? payload;

  ModelLogs({
    this.totalAllData,
    this.totalData,
    this.limit,
    this.totalPage,
    this.currentPage,
    this.lastPage,
    this.nextPage,
    this.previousPage,
    this.payload,
  });

  ModelLogs copyWith({
    int? totalAllData,
    int? totalData,
    int? limit,
    int? totalPage,
    int? currentPage,
    int? lastPage,
    int? nextPage,
    int? previousPage,
    List<UserLog>? payload,
  }) =>
      ModelLogs(
        totalAllData: totalAllData ?? this.totalAllData,
        totalData: totalData ?? this.totalData,
        limit: limit ?? this.limit,
        totalPage: totalPage ?? this.totalPage,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        nextPage: nextPage ?? this.nextPage,
        previousPage: previousPage ?? this.previousPage,
        payload: payload ?? this.payload,
      );

  factory ModelLogs.fromRawJson(String str) => ModelLogs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLogs.fromJson(Map<String, dynamic> json) => ModelLogs(
        totalAllData: json["totalAllData"],
        totalData: json["totalData"],
        limit: json["limit"],
        totalPage: json["totalPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        nextPage: json["nextPage"],
        previousPage: json["previousPage"],
        payload: json["payload"] == null ? [] : List<UserLog>.from(json["payload"]!.map((x) => UserLog.fromJson(x))),
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
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class UserLog {
  String? device;
  Map<String, dynamic>? lokasi;
  String? konten;
  String? idKonten;
  String? tipeKonten;
  String? createdAt;
  String? updatedAt;

  UserLog({
    this.device,
    this.lokasi,
    this.konten,
    this.idKonten,
    this.tipeKonten,
    this.createdAt,
    this.updatedAt,
  });

  UserLog copyWith({
    String? device,
    Map<String, dynamic>? lokasi,
    String? konten,
    String? idKonten,
    String? tipeKonten,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserLog(
        device: device ?? this.device,
        lokasi: lokasi ?? this.lokasi,
        konten: konten ?? this.konten,
        idKonten: idKonten ?? this.idKonten,
        tipeKonten: tipeKonten ?? this.tipeKonten,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserLog.fromRawJson(String str) => UserLog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLog.fromJson(Map<String, dynamic> json) => UserLog(
        device: json["device"],
        lokasi: json["lokasi"],
        konten: json["konten"],
        idKonten: json["idKonten"],
        tipeKonten: json["tipeKonten"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "device": device,
        "lokasi": lokasi,
        "konten": konten,
        "idKonten": idKonten,
        "tipeKonten": tipeKonten,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
