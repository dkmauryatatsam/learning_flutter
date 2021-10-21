import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String todoId;
  String content;
  String dateCreated;
  bool done;
  TodoModel({
    required this.todoId,
    required this.content,
    required this.dateCreated,
    required this.done,
  });
  factory TodoModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return TodoModel(
      todoId: snapshot.id,
      content: (snapshot.data() as Map<String, dynamic>)['content'],
      dateCreated:
          (snapshot.data() as Map<String, dynamic>)['dateCreated'].toString(),
      done: (snapshot.data() as Map<String, dynamic>)['done'],
    );
  }
}
