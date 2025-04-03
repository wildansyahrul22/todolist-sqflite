import 'package:get/get.dart';
import 'package:todolist_sqflite/modules/home/controller/home.controller.dart';
import 'package:todolist_sqflite/services/user.service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserService());
    Get.put(HomeController());
  }
}
