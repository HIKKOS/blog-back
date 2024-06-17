import 'dart:convert';

import 'package:equatable/equatable.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post extends Equatable {
  final String id;
  final String title;
  final String content;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authorId;
  final List<Comentario> comments;
  final Author author;

  const Post({
    this.photo,
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.authorId,
    required this.comments,
    required this.author,
  });

  Post copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    String? photo,
    DateTime? updatedAt,
    String? authorId,
    List<Comentario>? comments,
    Author? author,
    String? postId,
  }) =>
      Post(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        authorId: authorId ?? this.authorId,
        comments: comments ?? this.comments,
        author: author ?? this.author,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        photo: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        authorId: json["authorId"],
        comments: List<Comentario>.from(
            json["comments"].map((x) => Comentario.fromJson(x))),
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "authorId": authorId,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "author": author.toJson(),
      };
  @override
  List<Object?> get props =>
      [id, title, content, createdAt, updatedAt, authorId, comments, author];
}

class Author {
  final String? id;
  final String email;
  final String? photo;
  final String name;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  Author({
    required this.id,
    required this.email,
    this.photo,
    required this.name,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  Author copyWith({
    String? id,
    String? email,
    dynamic photo,
    String? name,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Author(
        id: id ?? this.id,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        name: name ?? this.name,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        email: json["email"],
        photo: json["photo"],
        name: json["name"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "photo": photo,
        "name": name,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Comentario {
  final String? id;
  final String? content;
  final DateTime? createdAt;

  final Author? author;

  Comentario({
    this.id,
    this.content,
    this.createdAt,
    this.author,
  });

  Comentario copyWith({
    String? id,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? postId,
    String? authorId,
    Author? author,
  }) =>
      Comentario(
        id: id ?? this.id,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        author: author ?? this.author,
      );

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        id: json["id"],
        content: json["content"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "author": author?.toJson(),
      };
}
