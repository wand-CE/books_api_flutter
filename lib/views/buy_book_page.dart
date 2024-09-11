import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:books_api_flutter/controllers/buy_book_view_controller.dart';

class BuyBookPage extends StatelessWidget {
  const BuyBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookTitle = Get.arguments['bookTitle'] ?? 'Livro';
    final url = Get.arguments['url'];

    final BuyBookViewController buyBookViewController = Get.find();

    buyBookViewController.loadPage(url);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$bookTitle',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: buyBookViewController.reloadPage,
          ),
        ],
      ),
      body: Obx(() {
        if (buyBookViewController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return WebViewWidget(
            controller: buyBookViewController.webViewController);
      }),
    );
  }
}
