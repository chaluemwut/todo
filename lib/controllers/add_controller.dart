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
  final isError = false.obs;
  final statusValue = 'IN_PROGRESS'.obs;
  XFile? image;
  final title = TextEditingController();
  final description = TextEditingController();
  var args;

  @override
  void onInit() {
    args = Get.arguments;
    if (args != null) {
      HomeItemModel homeItemModel = args as HomeItemModel;
      title.text = homeItemModel.title;
      description.text = homeItemModel.description;
      if (homeItemModel.imagePath != '') {
        imagePath(homeItemModel.imagePath);
        imagePath.refresh();
      }
    }
    super.onInit();
  }

  void onSaveTodo() async {
    if (title.text == '') {
      isError(true);
      return;
    }
    String uuid = const Uuid().v4();
    String saveImagePath = '';
    if (image != null) {
      var dir = await getApplicationDocumentsDirectory();
      saveImagePath = '${dir.path}/${uuid}.jpg';
      image!.saveTo(saveImagePath);
    }
    if (args == null) {
      sqlLifeService.insert(HomeItemModel(uuid, title.text, description.text,
          statusValue.value, saveImagePath));
    } else {
      HomeItemModel homeItemModel = args as HomeItemModel;
      if (saveImagePath == '' && homeItemModel.imagePath != '') {
        saveImagePath = homeItemModel.imagePath;
      }
      sqlLifeService.update(HomeItemModel(homeItemModel.uuid, title.text,
          description.text, statusValue.value, saveImagePath));
    }

    List<Map> list = await sqlLifeService.query();
    homeController.todoList.clear();
    homeController.todoList.addAll(list);
    homeController.todoList.refresh();
    title.clear();
    description.clear();
    image = null;
    imagePath('');
    Get.toNamed(RoutePath.home);
  }
}
