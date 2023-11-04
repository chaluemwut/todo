import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/binding/root_binding.dart';
import 'package:todo/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo app',
        initialBinding: RootBinding(),
        initialRoute: RoutePath.splash,
        getPages: AppPages.routes);
  }
}
