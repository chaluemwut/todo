import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/services/sqllite_service.dart';

class HomeController extends GetxController {
  final todoList = [].obs;
  final sqlLifeService = Get.find<SQLLifeService>();
  final activeSearch = [false, false, false].obs;
  final activeSearchField = ['title', 'created_at', 'status'];
  String dirPath = '';

  @override
  void onInit() async {
    List<Map> list = await sqlLifeService.query();
    todoList.addAll(list);
    todoList.refresh();
    initFile();
    super.onInit();
  }

  void initFile() async {
    dirPath = (await getApplicationDocumentsDirectory()).path;
  }

  void updateStatus(int index) {
    todoList[index].status = 'COMPLETE';
  }

  void sort(int index) async {
    activeSearch[index] = !activeSearch.value[index];
    List fieldList = [];
    for (int i = 0; i < activeSearch.length; i++) {
      if (activeSearch.value[i]) {
        fieldList.add(activeSearchField[i]);
      }
    }
    List<Map> todoDataList = [];
    if (fieldList.isEmpty) {
      todoDataList = await sqlLifeService.query();
    } else {
      todoDataList = await sqlLifeService.querySort(fieldList.join(','));
    }
    todoList.clear();
    todoList.addAll(todoDataList);
    todoList.refresh();
    activeSearch.refresh();
  }

  void search(String keyword) async {
    List todoDataList = await sqlLifeService.queryTitleAndDescription(keyword);
    todoList.clear();
    todoList.addAll(todoDataList);
    todoList.refresh();
    activeSearch.refresh();
  }
}
