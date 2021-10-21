import 'package:flutter/material.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/controller/user_controller.dart';
import 'package:todoapp/extension/x.dart';
import 'package:todoapp/screens/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  controller: emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Password"),
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Colors.grey[300],
                  onPressed: () async {
                    await controller.login(
                      emailController.text,
                      passwordController.text,
                    );
                    _userController.user = controller.user!.toModel();
                    print(_userController.user.email);
                    Get.back();
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignupScreen());
                  },
                  child: const Text('Not an user? SignUp'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
