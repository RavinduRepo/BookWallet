class BookModel {
  final String title;
  final String author;
  final int pages;
  final String genre;
  final String totalRating;
  final String imageUrl;
  final String description;

  BookModel({
    required this.title,
    required this.author,
    required this.pages,
    required this.genre,
    required this.totalRating,
    required this.imageUrl,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      author: json['author'],
      pages: json['pages'],
      genre: json['genre'],
      totalRating: json['totalRating'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'pages': pages,
      'genre': genre,
      'totalRating': totalRating,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}