// To parse this JSON data, do
//
//     final ecode = ecodeFromJson(jsonString);

// import 'dart:convert';

// Ecode ecodeFromJson(String str) => Ecode.fromJson(json.decode(str));

// String ecodeToJson(Ecode data) => json.encode(data.toJson());

class EcodeModel {
  String id;
  String status;
  String name;
  String detail;
  String category;

  EcodeModel({
    required this.id,
    required this.status,
    required this.name,
    required this.detail,
    required this.category,
  });

  factory EcodeModel.fromJson(Map<String, dynamic> json) => EcodeModel(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        detail: json["detail"],
        category: json["category"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "status": status,
  //       "name": name,
  //       "detail": detail,
  //       "category": category,
  //     };
}
