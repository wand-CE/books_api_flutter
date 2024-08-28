import 'package:books_api_flutter/views/home_page.dart';
import 'package:books_api_flutter/views/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const loginPage = '/loginPage';
  static const registerPage = '/registerPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      loginPage: (BuildContext context) => LoginPage(),
    };
  }
}
