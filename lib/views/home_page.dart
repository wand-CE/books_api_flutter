import 'package:books_api_flutter/controllers/book_api_controller.dart';
import 'package:books_api_flutter/models/book_model.dart';
import 'package:books_api_flutter/views/my_widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookApiController _bookController = Get.put(BookApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Livros mais populares',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/loginPage'),
                child: Text('s'))
          ],
        ),
      ),
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
              final booksList = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  BookModel currentBook = booksList[index];

                  return BookTile(
                    bookCoverPath: currentBook.cover,
                    bookTitle: currentBook.title,
                    bookDescription: currentBook.description,
                    buttonFunction: () => Get.toNamed(
                      '/bookDetailPage',
                      arguments: {
                        'bookTitle': currentBook.title,
                        'bookDescription': currentBook.description,
                        'bookCover': currentBook.cover,
                        'bookLink': currentBook.bookLink,
                      },
                    ),
                  );
                },
                itemCount: booksList.length,
              );
            } else {
              return Center(child: Text('Nenhum livro disponível'));
            }
          }),
    );
  }
}
