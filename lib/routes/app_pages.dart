import 'package:get/route_manager.dart';
import 'package:todo/binding/add_binding.dart';
import 'package:todo/binding/home_binding.dart';
import 'package:todo/binding/splash_binding.dart';
import 'package:todo/views/add.dart';
import 'package:todo/views/home.dart';
import 'package:todo/views/splash.dart';

class RoutePath {
  static String splash = "/splash_screen";
  static String home = "/home";
  static String add = "/add";
}

class AppPages {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: RoutePath.splash,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(name: RoutePath.home, page: () => const Home(), binding: HomeBinding()),
    GetPage(name: RoutePath.add, page: () => const Add(), binding: AddBinding())
  ];
}
