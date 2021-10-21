import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/model/user_model.dart';

extension UserToModel on User {
  UserModel toModel() {
    return UserModel(
      id: uid,
      name: displayName!,
      email: email!,
    );
  }
}
