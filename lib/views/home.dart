import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text('Search')),
              TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) => controller.search(value),
                  decoration: const InputDecoration(
                      hintText: ': title or description')),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text('Sort by')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[0]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(0),
                          child: const Text('Title')))),
                  SizedBox(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[1]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(1),
                          child: const Text('Date')))),
                  SizedBox(
                      width: (MediaQuery.sizeOf(context).width / 3) - 10,
                      child: Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.activeSearch.value[2]
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                          onPressed: () => controller.sort(2),
                          child: const Text('Status')))),
                ],
              ),
              Obx(() => Column(
                    children: [
                      ...List.generate(
                          controller.todoList.length,
                          (index) => HomeItemWidget(
                              homeItemModel: HomeItemModel.fromJson(
                                  controller.todoList[index]),
                              index: index))
                    ],
                  ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
          key: const Key('add_btn'),
          onPressed: () => Get.toNamed(RoutePath.add),
          child: const Icon(Icons.add)),
    );
  }
}
