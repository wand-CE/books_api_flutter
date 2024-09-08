import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final String book_cover_path;
  final String book_title;
  final String book_description;
  final VoidCallback button_function;

  const BookTile({
    super.key,
    required this.book_cover_path,
    required this.book_title,
    required this.book_description,
    required this.button_function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        tileColor: Colors.grey[300],
        leading: Image.network(
          book_cover_path,
          width: 70,
        ),
        title: Text(book_title),
        subtitle: Text(book_description),
        onTap: button_function,
      ),
    );
  }
}
