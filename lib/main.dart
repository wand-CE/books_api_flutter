import 'package:books_api_flutter/app_routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // A função acima Inicialização de toda a pré-estrutura necessára para o
  // funcionamento de apps de terceiros

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: AppRoutes.define(),
    initialRoute: AppRoutes.homePage,
  ));
}
