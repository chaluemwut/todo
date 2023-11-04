import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/add_controller.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/models/home_item_model.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/widgets/home_item_widget.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 20), child: Text('Search')),
              TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) => controller.search(value),
                  decoration:
                      InputDecoration(hintText: ': title or description')),
              Padding(
                  padding: EdgeInsets.only(top: 20), child: Text('Sort by')),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[0]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(0),
                          child: Text('Title')))),
                  Container(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[1]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(1),
                          child: Text('Date')))),
                  Container(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[2]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(2),
                          child: Text('Status')))),
                ],
              )),
              Obx(() => Column(
                    children: [
                      ...List.generate(
                          controller.todoList.length,
                          (index) => HomeItemWidget(
                              homeItemModel: HomeItemModel.fromJson(
                                  controller.todoList[index])))
                    ],
                  ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(RoutePath.add), child: Icon(Icons.add)),
    );
  }
}
