import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/controller/todo_controller.dart';
import 'package:todoapp/controller/user_controller.dart';
import 'package:todoapp/screens/widget/add_todo_card.dart';
import 'package:todoapp/screens/widget/todo_card.dart';

class HomeScreen extends GetView<AuthController> {
  HomeScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              AddTodoCard(
                uid: controller.user!.uid,
              ),
              GetX<TodoController>(
                init: Get.put(TodoController()),
                builder: (TodoController todoController) {
                  if (todoController.todos != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: todoController.todos!.length,
                        itemBuilder: (_, index) {
                          return TodoCard(
                              uid: controller.user!.uid,
                              todo: todoController.todos![index]);
                        },
                      ),
                    );
                  } else {
                    return const Text("Loading..");
                  }
                },
              )
            ],
          ),
        ));
  }
}
