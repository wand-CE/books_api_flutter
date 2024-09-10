import 'package:get/get_connect/connect.dart';
import 'package:books_api_flutter/models/book_model.dart';

class NytApiService extends GetConnect {
  final String apiKey = 'MINHA-CHAVE-API';

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://api.nytimes.com";
  }

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await get(
          '/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$apiKey');

      if (response.statusCode == 200) {
        final List<dynamic> resultado = response.body["results"]['books'];

        return resultado.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao retornar os livros');
      }
    } catch (e) {
      print(e);
      throw Exception('Não foi possível retornar os livros');
    }
  }
}
