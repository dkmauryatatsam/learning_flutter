import 'package:get/instance_manager.dart';
import 'package:newsapp/controller/new_controller.dart';
import 'package:newsapp/services/api_service.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: false);
    Get.put<NewsController>(NewsController());
  }
}
