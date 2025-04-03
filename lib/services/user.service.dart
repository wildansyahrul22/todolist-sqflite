import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_sqflite/helper/database.dart';
import 'package:todolist_sqflite/model/user.model.dart';

class UserService {
  final storage = Get.find<DatabaseService>();

  Future<List<User>> getUsers() async {
    List<User> users = [];
    String sql = 'SELECT * FROM users';
    try {
      final data = await storage.db.rawQuery(sql);
      if (data.isNotEmpty) {
        for (var e in data) {
          users.add(User.fromJson(e));
        }
      }
    } catch (e) {
      debugPrint('error getUsers(SERVICES): $e');
    }
    return users;
  }

  Future<int> insertUsers(data) async {
    int id = 0;
    if (data['id'] != null) {
      id = await storage.db
          .update('users', data, where: 'id = ?', whereArgs: [data['id']]);
    } else {
      id = await storage.db.insert('users', data);
    }
    return id;
  }

  Future<int> deleteUser(int id) async {
    return await storage.db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
