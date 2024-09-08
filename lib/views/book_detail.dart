import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   if (WebViewPlatform.instance == null && WebViewPlatform.isAvailable()) {
  //     WebViewPlatform.instance = SurfaceAndroidWebView();
  //   }
  // }

  // void _openBookPage(url) async {
  //   final Uri uri = Uri.parse(url);
  //   print(uri.authority);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //     // } else {
  //     //   throw 'Não foi possível abrir o link $uri';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final bookTitle = Get.arguments['bookTitle'];
    final bookDescription = Get.arguments['bookDescription'];
    final bookCover = Get.arguments['bookCover'];
    final bookLink = Get.arguments['bookLink'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          bookTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  bookCover,
                  height: 250,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Título:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              bookTitle,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            Text(
              bookDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(
                  '/buyBookPage',
                  arguments: {
                    'url': bookLink,
                    'bookTitle': bookTitle,
                  },
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Comprar Livro"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
