import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> registeruser(UserModel user) async {
    try {
      await _db
          .collection("Players")
          .add(user.toJson())
          .whenComplete(
            () => Get.snackbar("Success", "Your account has been created.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.greenAccent.withOpacity(8.1),
                colorText: Colors.black),
          )
          .catchError((error, stackTrace) {
        Get.snackbar("Error", "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent.withOpacity(0.1),
            colorText: Colors.black);
        print(error.toString());
      });
    } catch (e) {
      print(e);
    }
  }
}
