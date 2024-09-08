import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' sadsadas'),
        leading: ElevatedButton.icon(
            onPressed: () => Get.toNamed('/homePage'), label: Text('s')),
      ),
      body: Text('sdasd'),
    );
  }
}
