import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/auth_controller.dart';

class SignupScreen extends GetWidget<AuthController> {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                  decoration: const InputDecoration(hintText: "Name"),
                  controller: nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  onPressed: () {
                    controller.createUser(nameController.text,
                        emailController.text, passwordController.text);
                  },
                  child: const Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
