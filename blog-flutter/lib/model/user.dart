import 'dart:convert';

Usuario welcomeFromJson(String str) => Usuario.fromJson(json.decode(str));

String welcomeToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  final String id;
  final String email;
  final String? photo;
  final String name;

  Usuario({
    required this.id,
    required this.email,
    this.photo,
    required this.name,
  });

  Usuario copyWith({
    String? id,
    String? email,
    dynamic photo,
    String? name,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Usuario(
        id: id ?? this.id,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        name: name ?? this.name,
      );

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        email: json["email"],
        photo: json["photo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "photo": photo,
        "name": name,
      };
}
