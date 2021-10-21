import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/database.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.uid,
    required this.todo,
  }) : super(key: key);
  final String uid;
  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Database().deleteTodo(uid, todo.todoId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  todo.content,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Checkbox(
                value: todo.done,
                onChanged: (newValue) async {
                  await Database().updateTodo(newValue!, uid, todo.todoId);
                })
          ],
        ),
      ),
    );
  }
}
