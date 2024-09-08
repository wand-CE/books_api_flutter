import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:books_api_flutter/controllers/buy_book_view_controller.dart';

class BuyBookPage extends StatefulWidget {
  @override
  _BuyBookPageState createState() => _BuyBookPageState();
}

class _BuyBookPageState extends State<BuyBookPage> {
  late BuyBookViewController buyBookViewController;

  @override
  void initState() {
    super.initState();
    final url = Get.arguments['url'];
    buyBookViewController = Get.put(BuyBookViewController(url));
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
        title: Text(bookTitle),
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Recarrega a página através do controlador
              buyBookViewController.reloadPage();
            },
          ),
        ],
      ),
      body: WebViewWidget(
        controller: buyBookViewController.webViewController,
      ),
    );
  }
}
