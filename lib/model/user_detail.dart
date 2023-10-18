// To parse this JSON data, do
//
//     final userReq = userReqFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

UserDetail userReqFromJson(String str) => UserDetail.fromJson(json.decode(str));

String userReqToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
    @required this.age,
    @required this.city,
    @required this.gender,
    @required this.nameSurname,
  });

  int? age;
  String? city;
  String? gender;
  String? nameSurname;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        age: json["Age"],
        city: json["City"],
        gender: json["Gender"],
        nameSurname: json["NameSurname"],
      );

  Map<String, dynamic> toJson() => {
        "Age": age,
        "City": city,
        "Gender": gender,
        "NameSurname": nameSurname,
      };
}
