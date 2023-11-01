class NewsItem {
  final String url;
  final String category;
  final String img;
  final String title;

  NewsItem({
    required this.url,
    required this.category,
    required this.img,
    required this.title,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      url: json['url'],
      category: json['category'],
      img: json['img'],
      title: json['title'],
    );
  }
}
