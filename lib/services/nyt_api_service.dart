import 'package:get/get.dart';

import '../models/book_model.dart';

class NytApiService extends GetConnect {
  final String apiKey = 'MINHA-CHAVE-API';
  final url =
      "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json";

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await get('$url?api-key=$apiKey');

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
