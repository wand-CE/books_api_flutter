import 'package:books_api_flutter/controllers/book_controller.dart';
import 'package:books_api_flutter/models/book_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController _bookController = BookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meus Livros',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      drawer: Drawer(),
      body: FutureBuilder<List<BookModel>>(
          future: _bookController.getBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error.toString().replaceFirst("Exception:", ""),
              ));
            } else if (snapshot.hasData) {
              final list_of_books = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  BookModel current_book = list_of_books[index];

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      tileColor: Colors.grey[300],
                      leading: Image.network(
                        current_book.cover,
                        width: 70,
                      ),
                      title: Text(current_book.title),
                      subtitle: Text(current_book.description),
                      onTap: () {},
                    ),
                  );
                },
                itemCount: list_of_books.length,
              );
            } else {
              return Center(child: Text('Nenhum livro disponível'));
            }
          }),
    );
  }
}
