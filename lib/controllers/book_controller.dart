import 'package:books_api_flutter/models/book_model.dart';

import '../services/book_service.dart';

class BookController {
  final BookService _bookService = BookService();

  Future<List<BookModel>> getBooks() async {
    return await _bookService.fetchBooks();
  }
}
