import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/services/database.dart';

class AddTodoCard extends StatelessWidget {
  AddTodoCard({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;
  final TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Add todo.."),
              controller: todoController,
            ),
          ),
          IconButton(
              onPressed: () async {
                if (todoController.text != "") {
                  await Database().addTodo(todoController.text, uid);
                  todoController.clear();
                } else {
                  Get.snackbar("Error", "Please Write Something To Add",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
