import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_sqflite/services/user.service.dart';

class HomeController extends GetxController {
  final userService = Get.find<UserService>();

  var loading = false.obs;
  var listUser = [].obs;

  Future<void> getAllUsers() async {
    loading.value = true;
    listUser.clear();
    try {
      final users = await userService.getUsers();
      if (users.isNotEmpty) {
        for (var d in users) {
          listUser.add(d);
        }
      }
    } catch (e) {
      debugPrint('error getAllUsers(CONTROLLER): $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await userService.deleteUser(id);
      await getAllUsers();
    } catch (e) {
      debugPrint('error deleteUser(CONTROLLER): $e');
    }
  }

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }
}
