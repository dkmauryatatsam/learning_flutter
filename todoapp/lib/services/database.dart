import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/model/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id)
          .set({"name": user.name, "email": user.email});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore.collection("users").doc(uid).collection("todos").add(
          {"dateCreated": Timestamp.now(), "content": content, "done": false});
    } catch (e) {}
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> query) {
      List<TodoModel> retVal = [];
      query.docs
          .map((todo) => retVal.add(TodoModel.fromDocumentSnapshot(todo)))
          .toList();
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTodo(String uid, String todoId) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
