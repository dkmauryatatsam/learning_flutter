import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.id,
      name: (snapshot.data() as Map<String, dynamic>)['name'],
      email: (snapshot.data() as Map<String, dynamic>)['email'],
    );
  }
}
