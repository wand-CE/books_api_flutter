import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final String bookCoverPath;
  final String bookTitle;
  final String bookDescription;
  final String bookAuthor;
  final VoidCallback buttonFunction;

  const BookTile({
    super.key,
    required this.bookTitle,
    required this.bookDescription,
    required this.bookCoverPath,
    required this.bookAuthor,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          leading: Image.network(
            bookCoverPath,
            width: 70,
          ),
          title: Text(
            bookTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Autor(a): $bookAuthor"),
              SizedBox(height: 10),
              Text(bookDescription),
            ],
          ),
          onTap: buttonFunction,
        ),
      ),
    );
  }
}
