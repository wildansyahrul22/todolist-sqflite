import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist_sqflite/modules/home/controller/home.controller.dart';
import 'package:todolist_sqflite/services/user.service.dart';

class AddUserController extends GetxController {
  final userService = Get.find<UserService>();

  late TextEditingController? name = TextEditingController();
  late TextEditingController? email = TextEditingController();
  late TextEditingController? nohp = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    name?.dispose();
    email?.dispose();
    nohp?.dispose();
  }

  canSave() {
    if (name?.text == '' && email?.text == '' && nohp?.text == '') {
      return false;
    } else {
      return true;
    }
  }

  void addUser() async {
    if (!canSave()) {
      Get.snackbar('Terjadi Kesalahan', 'Harap Semua Data Diisi');
    } else if (!email!.text.isEmail) {
      Get.snackbar('Terjadi Kesalahan', 'Isi Email Dengan Benar');
    } else {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat("dd/MM/yyyy");
      final String formatted = formatter.format(now);

      Map<String, dynamic> data = {
        'name': name?.text,
        'email': email?.text,
        'nohp': nohp?.text,
        'created_at': formatted,
        'updated_at': '-',
      };
      // Call the service to insert the user
      await userService.insertUsers(data);
      Get.back();
      await Get.find<HomeController>().getAllUsers();
    }
  }
}
