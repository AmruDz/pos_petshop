class News {
  final String id;
  final String title;
  final String content;

  const News({
    required this.id,
    required this.title,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }
}
