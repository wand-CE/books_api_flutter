import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list_of_books = [
    {
      'book_title': 'Meu Livro',
      'book_description': 'Esse é um livro sobre mim mesmo',
      'book_cover':
          'https://virtual.ifro.edu.br/ariquemes/pluginfile.php/161618/user/icon/boost_union/f1?rev=4160746',
    },
    {
      'book_title': 'Clean Architecture',
      'book_description':
          'A Craftsman\'s Guide to Software Structure and Design',
      'book_cover':
          'https://www.oreilly.com/library/cover/9780134494272/1200w630h/',
    },
  ];

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
      body: ListView.builder(
        itemBuilder: (context, index) {
          Map<String, dynamic> current_book = list_of_books[index];

          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              tileColor: Colors.grey[300],
              leading: Image.network(
                current_book['book_cover'],
                width: 70,
              ),
              title: Text(current_book['book_title']),
              subtitle: Text(current_book['book_description']),
              onTap: () {},
            ),
          );
        },
        itemCount: list_of_books.length,
      ),
    );
  }
}
