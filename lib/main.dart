import 'package:books_api_flutter/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/book_api_controller.dart';
import 'controllers/buy_book_view_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // A função acima Inicialização de toda a pré-estrutura necessára para o
  // funcionamento de apps de terceiros

  final BookApiController bookController = Get.put(BookApiController());
  final BuyBookViewController buyBookViewController =
      Get.put(BuyBookViewController());

  runApp(GetMaterialApp(
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
    debugShowCheckedModeBanner: false,
  ));
}
