import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../di/di_manager.dart';
import '../screen_utils/device_utils.dart';

class CustomSnackbar {
  static const String routeName = 'CustomSnackbar/showSnackbar';

  static showSnackbar(String message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.all(ScreenHelper.fromHeight(1)),
      duration: const Duration(seconds: 2),
      borderRadius: ScreenHelper.fromWidth55(0.5),
      animationDuration: const Duration(seconds: 1),
      backgroundColor: DIManager.findCC().primaryColor.withOpacity(0.9),
      isDismissible: true,
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      'message',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      isDismissible: true,
      titleText: Text(
        'Error',
        style:
            TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),
      ),
      messageText: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
