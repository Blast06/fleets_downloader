// To parse this JSON data, do
//
//     final fleets = fleetsFromJson(jsonString);

import 'dart:convert';

List<Fleets> fleetsFromJson(String str) =>
    List<Fleets>.from(json.decode(str).map((x) => Fleets.fromJson(x)));

String fleetsToJson(List<Fleets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fleets {
  Fleets({
    this.url,
    this.type,
    this.preview,
  });

  String url;
  String type;
  String preview;

  factory Fleets.fromJson(Map<String, dynamic> json) => Fleets(
        url: json["url"],
        type: json["type"] == null ? null : json["type"],
        preview: json["preview"] == null ? null : json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type == null ? null : type,
        "preview": preview == null ? null : preview,
      };
}
