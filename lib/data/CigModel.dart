// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Cigs clientFromJson(String str) => Cigs.fromMap(json.decode(str));

String clientToJson(Cigs data) => json.encode(data.toMap());

class Cigs {
    int id;
    int year;
    int month;
    int day;
    int hour;
    int minute;

    Cigs({
        this.id,
        this.year,
        this.month,
        this.day,
        this.hour,
        this.minute,
    });

    factory Cigs.fromMap(Map<String, dynamic> json) => Cigs(
        id: json["id"],
        year: json["year"],
        month: json["month"],
        day: json["day"],
        hour: json["hour"],
        minute: json["minute"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
    };
}
