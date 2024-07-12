// To parse this JSON data, do
//
//     final mapPointer = mapPointerFromJson(jsonString);

import 'dart:convert';

MapPointer mapPointerFromJson(String str) => MapPointer.fromJson(json.decode(str));
List<MapPointer> listMapPointerFromJson(String result) => List<MapPointer>.from(jsonDecode(result).map((e) => MapPointer.fromJson(e)));
String mapPointerToJson(MapPointer data) => json.encode(data.toJson());

class MapPointer {
    num lang;
    num long;
    String pointer;
    String dateTime;
    String id;

    MapPointer({
        required this.lang,
        required this.long,
        required this.pointer,
        required this.dateTime,
        required this.id,
    });

    factory MapPointer.fromJson(Map<String, dynamic> json) => MapPointer(
        lang: json["lang"],
        long: json["long"],
        pointer: json["pointer"],
        dateTime: json["dateTime"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "lang": lang,
        "long": long,
        "pointer": pointer,
        "dateTime": dateTime,
        "id": id,
    };
}
