import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  static void snackbarError(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.blue,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white);
  }

  static void snackbarSuccess(String message) {
    Get.snackbar("Success", message,
        backgroundColor: Colors.blue,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white);
  }
}
