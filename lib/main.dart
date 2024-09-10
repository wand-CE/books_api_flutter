import 'package:books_api_flutter/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // A função acima Inicialização de toda a pré-estrutura necessára para o
  // funcionamento de apps de terceiros

  runApp(GetMaterialApp(
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
    debugShowCheckedModeBanner: false,
  ));
}
