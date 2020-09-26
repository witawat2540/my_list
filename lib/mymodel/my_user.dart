// To parse this JSON data, do
//
//     final myUserModel = myUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyUserModel myUserModelFromJson(String str) => MyUserModel.fromJson(json.decode(str));

String myUserModelToJson(MyUserModel data) => json.encode(data.toJson());

class MyUserModel {
  MyUserModel({
    @required this.page,
    @required this.perPage,
    @required this.total,
    @required this.totalPages,
    @required this.data,
    @required this.ad,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Ad ad;

  factory MyUserModel.fromJson(Map<String, dynamic> json) => MyUserModel(
    page: json["page"] == null ? null : json["page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    total: json["total"] == null ? null : json["total"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    ad: json["ad"] == null ? null : Ad.fromJson(json["ad"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "per_page": perPage == null ? null : perPage,
    "total": total == null ? null : total,
    "total_pages": totalPages == null ? null : totalPages,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "ad": ad == null ? null : ad.toJson(),
  };
}

class Ad {
  Ad({
    @required this.company,
    @required this.url,
    @required this.text,
  });

  String company;
  String url;
  String text;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    company: json["company"] == null ? null : json["company"],
    url: json["url"] == null ? null : json["url"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "company": company == null ? null : company,
    "url": url == null ? null : url,
    "text": text == null ? null : text,
  };
}

class Datum {
  Datum({
    @required this.id,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "avatar": avatar == null ? null : avatar,
  };
}
