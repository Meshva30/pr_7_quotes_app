class Quote {
  // final int id;
  final String quote;
  final String author;
  final String category;

  Quote({
    // required this.id,
    required this.quote,
    required this.author,
    required this.category,
  });


  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'quote': quote,
      'author': author,
      'category': category,
    };
  }

  // Convert a Map to a Quote
  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      // id: map['id'],
      quote: map['quote'],
      author: map['author'],
      category: map['category'],
    );
  }
}
