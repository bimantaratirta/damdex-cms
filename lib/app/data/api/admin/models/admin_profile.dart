import 'dart:convert';

class ModelAdminProfile {
  String? id;
  String? username;
  String? nama;
  String? createdAt;
  String? updatedAt;

  ModelAdminProfile({
    this.id,
    this.username,
    this.nama,
    this.createdAt,
    this.updatedAt,
  });

  ModelAdminProfile copyWith({
    String? id,
    String? username,
    String? nama,
    String? createdAt,
    String? updatedAt,
  }) =>
      ModelAdminProfile(
        id: id ?? this.id,
        username: username ?? this.username,
        nama: nama ?? this.nama,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ModelAdminProfile.fromRawJson(String str) => ModelAdminProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelAdminProfile.fromJson(Map<String, dynamic> json) => ModelAdminProfile(
        id: json["id"],
        username: json["username"],
        nama: json["nama"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama": nama,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
