// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Cure clientFromJson(String str) => Cure.fromMap(json.decode(str));

String clientToJson(Cure data) => json.encode(data.toMap());

class Cure {
    int id;
    int year;
    int month;
    int day;
    int amount;

    Cure({
        this.id,
        this.year,
        this.month,
        this.day,
        this.amount,
    });

    factory Cure.fromMap(Map<String, dynamic> json) => Cure(
        id: json["id"],
        year: json["year"],
        month: json["month"],
        day: json["day"],
        amount: json["amount"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "year": year,
        "month": month,
        "day": day,
        "amount": amount,
    };
}
