// To parse this JSON data, do
//
//     final newsDetailModel = newsDetailModelFromJson(jsonString);

// import 'dart:convert';

// NewsDetailModel newsDetailModelFromJson(String str) =>
//     NewsDetailModel.fromJson(json.decode(str));

// String newsDetailModelToJson(NewsDetailModel data) =>
//     json.encode(data.toJson());

class NewsDetailModel {
  String title;
  String img;
  String writer;
  String date;
  String content;

  NewsDetailModel({
    required this.title,
    required this.img,
    required this.writer,
    required this.date,
    required this.content,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) =>
      NewsDetailModel(
        title: json["title"],
        img: json["img"],
        writer: json["writer"],
        date: json["date"],
        content: json["content"],
      );
  // Map<String, dynamic> toJson() => {
  //       "title": title,
  //       "img": img,
  //       "writer": writer,
  //       "date": date,
  //       "content": content,
  //     };
}
