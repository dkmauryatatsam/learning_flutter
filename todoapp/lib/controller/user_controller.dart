import 'package:get/get.dart';
import 'package:todoapp/model/user_model.dart';

class UserController extends GetxController {
  Rxn<UserModel> userModel = Rxn<UserModel>();

  UserModel get user => userModel.value!;
  set user(UserModel value) => userModel.value = value;

  void clear() {
    userModel(null);
  }
}
