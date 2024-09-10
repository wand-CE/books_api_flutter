import 'package:books_api_flutter/views/book_detail.dart';
import 'package:books_api_flutter/views/buy_book_page.dart';
import 'package:books_api_flutter/views/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const bookDetailPage = '/bookDetailPage';
  static const buyBookPage = '/buyBookPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      bookDetailPage: (BuildContext context) => BookDetailPage(),
      buyBookPage: (BuildContext context) => BuyBookPage(),
    };
  }
}
