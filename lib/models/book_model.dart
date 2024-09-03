class BookModel {
  String cover;
  String title;
  String description;

  BookModel({
    required this.cover,
    required this.title,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      cover: json["book_image"],
      title: json["title"],
      description: json["description"],
    );
  }
}
