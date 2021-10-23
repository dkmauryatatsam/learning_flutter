import 'dart:developer';

import 'package:clean_arch_practice1/features/feature1/domain/entities/post_entity.dart';
import 'package:get/state_manager.dart';

import 'package:clean_arch_practice1/features/feature1/domain/usecases/get_posts.dart';

enum PageState { initial, loading, loaded, failed }

class PostController extends GetxController {
  final GetPosts getPosts;
  PostController({
    required this.getPosts,
  });

  RxList<PostEntity> posts = RxList([]);
  var pageState = Rx<PageState>(PageState.initial);

  Future<void> fetchPosts() async {
    pageState(PageState.loading);
    final postData = await getPosts();
    postData.fold(
      (f) {
        log(f.toString());
        pageState(PageState.failed);
      },
      (r) {
        posts.value = r;
        pageState(PageState.loaded);
      },
    );
  }

  @override
  Future<void> onInit() async {
    await fetchPosts();
    super.onInit();
  }
}
