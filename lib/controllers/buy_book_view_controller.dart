import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyBookViewController extends GetxController {
  late final WebViewController webViewController;

  final String url;

  BuyBookViewController(this.url) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  // Função para recarregar a página
  void reloadPage() {
    webViewController.reload();
  }
}

// class BuyBookViewController extends GetxController {
//   late BuyBookViewController webViewController;
//
//   // Função para carregar uma nova URL
//
//
//   // Função para recarregar a página
//   void reloadPage() {
//     webViewController.reload();
//   }
//
//   // Inicialização do controlador do WebView
//   void onWebViewCreated(WebViewController controller) {
//     webViewController = controller;
//   }
// }
