import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyBookViewController extends GetxController {
  late WebViewController webViewController;
  var isLoading = true.obs;

  BuyBookViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  void loadPage(url) {
    isLoading.value = true;
    webViewController.loadRequest(Uri.parse(url)).then((_) async {
      await Future.delayed(Duration(seconds: 3));
      isLoading.value = false;
    });
  }

  void reloadPage() {
    webViewController.reload();
  }
}
