import 'package:books_api_flutter/models/book_model.dart';
import 'package:books_api_flutter/services/nyt_api_service.dart';
import 'package:get/get.dart';

class BookApiController extends GetxController {
  final NytApiService _nytApiService = NytApiService();

  var books = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  Future<void> getBooks() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 2));
      final booksFetched = await _nytApiService.fetchBooks();
      books.assignAll(booksFetched);
    } finally {
      isLoading(false);
    }
  }
}
