import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/controllers/home_controller.dart';
import 'package:todo/models/home_item_model.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/services/sqllite_service.dart';
import 'package:uuid/uuid.dart';

class AddController extends GetxController {
  final homeController = Get.find<HomeController>();
  final sqlLifeService = Get.find<SQLLifeService>();
  final imagePath = ''.obs;
  XFile? image;

  void onSaveTodo(
      TextEditingController title, TextEditingController description) async {
    String uuid = const Uuid().v4();
    String saveImagePath = '';
    if (image != null) {
      var dir = await getApplicationDocumentsDirectory();
      saveImagePath = '${dir.path}/${uuid}.jpg';
      image!.saveTo(saveImagePath);
    }
    sqlLifeService.insert(HomeItemModel(
        uuid, title.text, description.text, 'IN_PROGRESS', saveImagePath));
    List<Map> list = await sqlLifeService.query();
    homeController.todoList.clear();
    homeController.todoList.addAll(list);
    homeController.todoList.refresh();
    image = null;
    imagePath('');
    Get.toNamed(RoutePath.home);
  }
}
