class Quote {
  final int? id;
  final String quote;
  final String author;
  final String category;

  Quote({
    this.id, // Optional id
    required this.quote,
    required this.author,
    required this.category,
  });

  factory Quote.fromMap(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] as int?,
      quote: json['quote'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
      'category': category,
    };
  }
}
