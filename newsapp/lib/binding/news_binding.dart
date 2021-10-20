import 'package:get/instance_manager.dart';
import 'package:newsapp/controller/new_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewsController>(NewsController());
  }
}
