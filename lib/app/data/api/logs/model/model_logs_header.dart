import 'dart:convert';

class ModelLogsHeader {
  int? total;

  ModelLogsHeader({
    this.total,
  });

  ModelLogsHeader copyWith({
    int? total,
  }) =>
      ModelLogsHeader(
        total: total ?? this.total,
      );

  factory ModelLogsHeader.fromRawJson(String str) => ModelLogsHeader.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLogsHeader.fromJson(Map<String, dynamic> json) => ModelLogsHeader(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
