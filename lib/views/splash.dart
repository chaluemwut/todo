import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF71C6D2),
      body: Center(
        child: Text('Todo App')
      ),
    );
  }
}
