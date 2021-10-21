import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/controller/user_controller.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';

class Root extends GetView<AuthController> {
  Root({Key? key}) : super(key: key);
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user?.uid != null) {
        return HomeScreen();
      }
      return LoginScreen();
    });
  }
}
