import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_sqflite/helper/database.dart';
import 'package:todolist_sqflite/modules/add_user/binding/add.binding.dart';
import 'package:todolist_sqflite/modules/add_user/screen/add.screen.dart';
import 'package:todolist_sqflite/modules/edit_user/binding/edit.binding.dart';
import 'package:todolist_sqflite/modules/edit_user/screen/edit.screen.dart';
import 'package:todolist_sqflite/modules/home/binding/home.binding.dart';
import 'package:todolist_sqflite/modules/home/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseService = DatabaseService();
  await databaseService.initDatabase();

  Get.put(databaseService);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(
            name: '/add_user',
            page: () => AddUserScreen(),
            binding: AddUserBinding()),
        GetPage(
            name: '/edit_user',
            page: () => EdituserScreen(),
            binding: EditUserBinding()),
      ],
    );
  }
}
