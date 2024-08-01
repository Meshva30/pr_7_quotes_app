class Quote {
  final int? id;
  final String quote;
  final String author;
  final String category;
  bool liked;

  Quote({
    this.id,
    required this.quote,
    required this.author,
    required this.category,
    this.liked = false,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
      'category': category,
      'liked': liked ? 1 : 0,
    };
  }

  // Convert a Map to a Quote
  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      quote: map['quote'],
      author: map['author'],
      category: map['category'],
      liked: map['liked'] == 1,
    );
  }
}
