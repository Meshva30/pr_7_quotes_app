// class Quote {
//   final String quote;
//   final String author;
//   bool liked;
//   final String category;
//
//   Quote({
//     required this.quote,
//     required this.author,
//     required this.liked,
//     required this.category,
//   });
//
//   factory Quote.fromMap(Map<String, dynamic> map) {
//     return Quote(
//       quote: map['quote'],
//       author: map['author'],
//       liked: map['liked'] == 0,
//       category: map['category'],
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'quote': quote,
//       'author': author,
//       'liked': liked ? 1 : 0,
//       'category': category,
//     };
//   }
// }

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
      liked: map['liked'] == 1, // Convert int to bool
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
      'liked': liked ? 1 : 0, // Convert bool to int
      'category': category,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Quote &&
              runtimeType == other.runtimeType &&
              quote == other.quote &&
              author == other.author &&
              category == other.category; // Compare essential fields

  @override
  int get hashCode =>
      quote.hashCode ^ author.hashCode ^ category.hashCode; // Combine fields for hash code
}


