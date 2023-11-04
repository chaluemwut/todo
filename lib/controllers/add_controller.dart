import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/models/home_item_model.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/services/share_preference.dart';
import 'package:todo/services/sqllite_service.dart';
import 'package:uuid/uuid.dart';

class AddController extends GetxController {
  final homeController = Get.find<HomeController>();
  // final sharedPreference = Get.find<SharePreferenceService>();
  final sqlLifeService = Get.find<SQLLifeService>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // void initDb() async {
  //   database = await openDatabase(
  //     'todo.db',
  //     onConfigure: (db) async {
  //       await db.execute(
  //           '''create table if not exists todo (uuid text primary key, title text, description text, created_at text DEFAULT CURRENT_TIMESTAMP, status text)
  //           ''');
  //     },
  //   );
  // }


  void onSaveTodo(
      TextEditingController title, TextEditingController description) async {
    // await database.insert(
    //     'todo',
    //     HomeItemModel(
    //             const Uuid().v4(), title.text, description.text, 'IN_PROGRESS')
    //         .toJson());
    // List<Map> list =
    //     await database.rawQuery('select * from todo order by created_at desc');
    sqlLifeService.insert(HomeItemModel(
        const Uuid().v4(), title.text, description.text, 'IN_PROGRESS'));
    List<Map> list = await sqlLifeService.query();
    homeController.todoList.clear();
    homeController.todoList.addAll(list);
    homeController.todoList.refresh();
    Get.toNamed(RoutePath.home);
  }
}
