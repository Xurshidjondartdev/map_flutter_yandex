// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    String? suggestReqid;
    List<Result>? results;

    SearchModel({
        this.suggestReqid,
        this.results,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        suggestReqid: json["suggest_reqid"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "suggest_reqid": suggestReqid,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Title? title;
    Title? subtitle;
    List<String>? tags;
    Distance? distance;

    Result({
        this.title,
        this.subtitle,
        this.tags,
        this.distance,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        subtitle: json["subtitle"] == null ? null : Title.fromJson(json["subtitle"]),
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
        "subtitle": subtitle?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "distance": distance?.toJson(),
    };
}

class Distance {
    double? value;
    String? text;

    Distance({
        this.value,
        this.text,
    });

    factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        value: json["value"]?.toDouble(),
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
    };
}

class Title {
    String? text;
    List<Hl>? hl;

    Title({
        this.text,
        this.hl,
    });

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        text: json["text"],
        hl: json["hl"] == null ? [] : List<Hl>.from(json["hl"]!.map((x) => Hl.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "hl": hl == null ? [] : List<dynamic>.from(hl!.map((x) => x.toJson())),
    };
}

class Hl {
    int? begin;
    int? end;

    Hl({
        this.begin,
        this.end,
    });

    factory Hl.fromJson(Map<String, dynamic> json) => Hl(
        begin: json["begin"],
        end: json["end"],
    );

    Map<String, dynamic> toJson() => {
        "begin": begin,
        "end": end,
    };
}
