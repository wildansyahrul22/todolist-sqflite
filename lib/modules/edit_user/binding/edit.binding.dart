import 'package:get/get.dart';
import 'package:todolist_sqflite/modules/edit_user/controller/edit.controller.dart';

class EditUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditUserController());
  }
}
