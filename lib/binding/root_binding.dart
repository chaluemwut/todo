import 'package:get/get.dart';
import 'package:todo/services/sqllite_service.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SQLLifeService());
  }
}
