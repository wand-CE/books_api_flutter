import 'package:books_api_flutter/controllers/book_api_controller.dart';
import 'package:books_api_flutter/models/book_model.dart';
import 'package:books_api_flutter/views/my_widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BookApiController _bookApiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Livros mais populares do NYT',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      body: Obx(() {
        if (_bookApiController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        final booksList = _bookApiController.books;

        return ListView.builder(
          itemCount: booksList.length,
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
        );
      }),
    );
  }
}
