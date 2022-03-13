// To parse this JSON data, do


import 'dart:convert';

HeaderModel onBoardUserModelFromJson(String str) =>
    HeaderModel.fromJson(json.decode(str));

String onBoardUserModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  String? authorization;

  HeaderModel({
    required this.authorization,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        authorization: json["Authorization"],
      );

  Map<String, dynamic> toJson() => {
        "Authorization": authorization,
      };
  Map<String, String> toHeader() => {
        "Authorization": authorization ?? " ",
      };
}
