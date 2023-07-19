// To parse this JSON data, do
//
//     final document = documentFromJson(jsonString);

import 'dart:convert';

import 'base_search_item.dart';

Document documentFromJson(String str) => Document.fromJson(json.decode(str));

String documentToJson(Document data) => json.encode(data.toJson());

class Document extends SearchItem {
  String? name;
  String? partner;
  int? status;
  @override
  String? label;
  @override
  dynamic value;
  @override
  String? type;

  Document({
    this.name,
    this.partner,
    this.status,
    this.label,
    this.value,
    this.type,
  });

  @override
  Document copyWith({
    String? name,
    String? partner,
    int? status,
    String? label,
    dynamic value,
    String? type,
  }) =>
      Document(
        name: name ?? this.name,
        partner: partner ?? this.partner,
        status: status ?? this.status,
        label: label ?? this.label,
        value: value ?? this.value,
        type: type ?? this.type,
      );

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    name: json["name"],
    partner: json["partner"],
    status: json["status"],
    label: json["label"],
    value: json["value"],
    type: json["type"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "partner": partner,
    "status": status,
    "label": label,
    "value": value,
    "type": type,
  };
}
