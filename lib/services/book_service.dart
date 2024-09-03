import '../models/book_model.dart';
import 'package:dio/dio.dart';

class BookService {
  final _dio = Dio();
  final String apiKey = 'YOUR-API-KEY-HERE';

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await _dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=$apiKey');
      if (response.statusCode == 200) {
        // abaixo pego a  primeira lista que retornou
        final List<dynamic> resultado =
            response.data["results"]["lists"][0]['books'];
        return resultado.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao retornar os livros');
      }
    } catch (e) {
      throw Exception('Não foi possível retornar os livros');
    }
  }
}
