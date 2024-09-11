import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyBookViewController extends GetxController {
  late WebViewController webViewController;
  var isLoading = true.obs;

  BuyBookViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  Future<void> loadPage(url) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    webViewController.loadRequest(Uri.parse(url)).then((_) {
      isLoading.value = false;
    });
  }

  void reloadPage() {
    webViewController.reload();
  }
}
