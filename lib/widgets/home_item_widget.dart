import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/models/home_item_model.dart';
import 'package:todo/routes/app_pages.dart';

class HomeItemWidget extends StatelessWidget {
  final HomeItemModel homeItemModel;
  final index;
  HomeItemWidget({super.key, required this.homeItemModel, required this.index});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: InkWell(
                key: Key('$index'),
                onTap: () {
                  Get.toNamed(RoutePath.add, arguments: homeItemModel);
                },
                child: Card(
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(homeItemModel.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                            Text(homeItemModel.description),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Text('Status : ${homeItemModel.status}')),
                            if (homeItemModel.imagePath != '')
                              SizedBox(
                                  width: 60,
                                  child: Image.file(
                                      File("${homeItemModel.imagePath}")))
                          ])),
                ))));
  }
}
