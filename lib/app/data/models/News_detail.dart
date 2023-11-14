class NewsDetailModel {
  final String title;
  final String img;
  final String writer;
  final String date;
  final String content;

  NewsDetailModel({
    required this.title,
    required this.img,
    required this.writer,
    required this.date,
    required this.content,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      title: json['title'],
      img: json['img'],
      writer: json['writer'],
      date: json['date'],
      content: json['content'],
    );
  }

  toMap() {
    return{
      "title" : title,
      "img" : img,
      "writer" : writer,
      "date" : date,
      "content" : content,
    };
  }
}
