import 'package:get/get.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/database.dart';

class TodoController extends GetxController {
  Rxn<List<TodoModel>> todoList = Rxn<List<TodoModel>>();
  List<TodoModel>? get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user!.uid;
    todoList.bindStream(Database().todoStream(uid));
    super.onInit();
  }
}
