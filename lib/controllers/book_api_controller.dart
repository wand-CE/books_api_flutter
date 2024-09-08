import 'package:books_api_flutter/models/book_model.dart';
import 'package:books_api_flutter/services/nyt_api_service.dart';
import 'package:get/get.dart';

class BookController {
  final _nytApiService = Get.put(NytApiService());

  Future<List<BookModel>> getBooks() async {
    return await _nytApiService.fetchBooks();
  }
}
