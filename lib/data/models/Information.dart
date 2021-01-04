// To parse this JSON data, do
//
//     final information = informationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Information> informationFromJson(String str) => List<Information>.from(
    json.decode(str).map((x) => Information.fromJson(x)));

String informationToJson(List<Information> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Information {
  Information({
    @required this.id,
    @required this.description,
    @required this.name,
    @required this.publishedAt,
    @required this.createdAt,
    @required this.updatedAt,
  });

  final int id;
  final String description;
  final String name;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["id"],
        description: json["description"],
        name: json["name"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "name": name,
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
