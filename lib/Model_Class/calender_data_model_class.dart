// To parse this JSON data, do
//
//     final calenderData = calenderDataFromJson(jsonString);

import 'dart:convert';

CalenderData calenderDataFromJson(String str) => CalenderData.fromJson(json.decode(str));

String calenderDataToJson(CalenderData data) => json.encode(data.toJson());

class CalenderData {
  List<Datum>? data;

  CalenderData({
    this.data,
  });

  factory CalenderData.fromJson(Map<String, dynamic> json) => CalenderData(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? date;
  String? name;
  String? category;
  String? location;

  Datum({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    date: json["date"],
    name: json["name"],
    category: json["category"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "name": name,
    "category": category,
    "location": location,
  };
}
