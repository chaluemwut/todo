import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/models/home_item_model.dart';

class HomeItemWidget extends StatelessWidget {
  final HomeItemModel homeItemModel;
  HomeItemWidget({super.key, required this.homeItemModel});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
           width: MediaQuery.of(context).size.width,
            child: Card(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(homeItemModel.title),
                    Text(homeItemModel.description)
                  ])),
        )));
  }
}
