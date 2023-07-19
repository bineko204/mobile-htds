// To parse this JSON data, do
//
//     final searchItem = searchItemFromJson(jsonString);

import 'dart:convert';

class SearchItem {
  String? label;
  dynamic value;
  String? type;

  SearchItem({
    this.label,
    this.value,
    this.type,
  });

  SearchItem copyWith({
    String? label,
    dynamic value,
    String? type,
  }) =>
      SearchItem(
        label: label ?? this.label,
        value: value ?? this.value,
        type: type ?? this.type,
      );

  factory SearchItem.fromRawJson(String str) => SearchItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
    label: json["label"],
    value: json["value"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": value,
    "type": type,
  };
}
