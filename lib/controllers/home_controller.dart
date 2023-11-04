import 'package:get/get.dart';
import 'package:todo/services/sqllite_service.dart';

enum SortFile {
  title,
  date,
  status
}

class HomeController extends GetxController {
  RxList todoList = [].obs;
  final sqlLifeService = Get.find<SQLLifeService>();
  final activeSearch = [false, false, false].obs;

  @override
  void onInit() async {
    List<Map> list = await sqlLifeService.query();
    todoList.addAll(list);
    todoList.refresh();
    super.onInit();
  }

  void sort(){

  }
}
