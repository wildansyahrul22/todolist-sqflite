import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_sqflite/modules/home/controller/home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'List User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Get.toNamed('/add_user');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        return controller.listUser.isEmpty
            ? Center(
                child: const Text("Belum ada user"),
              )
            : ListView.builder(
                itemCount: controller.listUser.length,
                itemBuilder: (context, i) {
                  final user = controller.listUser[i];
                  return ListTile(
                    leading: const CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => controller.deleteUser(user.id),
                    ),
                    onTap: () {
                      Get.toNamed(
                        '/edit_user',
                        arguments: user,
                      );
                    },
                  );
                },
              );
      }),
    );
  }
}
