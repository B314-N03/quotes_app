class Quotes {
  final String id;
  final String author;
  final String content;
  final int length;
  Quotes(
      {required this.id,
      required this.author,
      required this.content,
      required this.length});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      length: json['length'],
    );
  }
}
