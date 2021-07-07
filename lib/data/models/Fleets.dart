// To parse this JSON data, do
//
//     final fleets = fleetsFromJson(jsonString);

import 'dart:convert';

Fleets fleetsFromJson(String str) => Fleets.fromJson(json.decode(str));

String fleetsToJson(Fleets data) => json.encode(data.toJson());

class Fleets {
  Fleets({
    this.data,
  });

  List<Datum>? data;

  factory Fleets.fromJson(Map<String, dynamic> json) => Fleets(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.url,
    this.type,
    this.preview,
  });

  String? url;
  String? type;
  String? preview;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        url: json["url"],
        type: json["type"],
        preview: json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
        "preview": preview,
      };
}
