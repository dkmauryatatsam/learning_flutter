import 'package:clean_arch_practice1/features/feature1/data/datasources/post_remote_data.dart';
import 'package:clean_arch_practice1/features/feature1/data/repositories/post_repository_impl.dart';
import 'package:clean_arch_practice1/features/feature1/domain/repositories/post_repository.dart';
import 'package:clean_arch_practice1/features/feature1/domain/usecases/get_posts.dart';
import 'package:clean_arch_practice1/features/feature1/presentation/controller/post_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController(getPosts: Get.find<GetPosts>()));
    Get.lazyPut(
      () => GetPosts(repository: Get.find<PostRepository>()),
      fenix: false,
    );
    Get.lazyPut<PostRepository>(
      () => PostRepositoryImpl(postRemoteData: Get.find<PostRemoteData>()),
      fenix: false,
    );
    Get.lazyPut<PostRemoteData>(
      () => PostRemoteDataImpl(client: Get.find<http.Client>()),
      fenix: false,
    );
    Get.lazyPut<http.Client>(
      () => http.Client(),
      fenix: false,
    );
  }
}
