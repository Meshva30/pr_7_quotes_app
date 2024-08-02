class Quote {
  final String quote;
  final String author;
  bool liked;
  final String category;

  Quote({
    required this.quote,
    required this.author,
    required this.liked,
    required this.category,
  });

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'],
      author: map['author'],
      liked: map['liked'] == 1,
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
      'liked': liked ? 1 : 0,
      'category': category,
    };
  }
}
