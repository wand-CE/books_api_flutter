import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:books_api_flutter/controllers/buy_book_view_controller.dart';

class BuyBookPage extends StatefulWidget {
  const BuyBookPage({super.key});

  @override
  State<BuyBookPage> createState() => _BuyBookPageState();
}

class _BuyBookPageState extends State<BuyBookPage> {
  late BuyBookViewController _buyBookViewController;

  @override
  void initState() {
    super.initState();
    final url = Get.arguments['url'];
    _buyBookViewController = Get.put(BuyBookViewController(url));
  }

  @override
  void dispose() {
    Get.delete<BuyBookViewController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookTitle = Get.arguments['bookTitle'] ?? 'Livro';

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
            onPressed: _buyBookViewController.reloadPage,
          ),
        ],
      ),
      body: WebViewWidget(controller: _buyBookViewController.webViewController),
    );
  }
}
