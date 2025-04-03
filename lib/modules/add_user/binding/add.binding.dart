import 'package:get/get.dart';
import 'package:todolist_sqflite/modules/add_user/controller/add.controller.dart';

class AddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddUserController());
  }
}
