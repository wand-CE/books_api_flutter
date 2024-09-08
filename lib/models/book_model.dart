class BookModel {
  String cover;
  String title;
  String description;
  String bookLink;

  BookModel({
    required this.cover,
    required this.title,
    required this.description,
    required this.bookLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        cover: json["book_image"],
        title: json["title"],
        description: json["description"],
        bookLink: json["buy_links"][0]["url"] ?? '');
  }
}
