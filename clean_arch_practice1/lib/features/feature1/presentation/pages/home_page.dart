import 'package:clean_arch_practice1/features/feature1/presentation/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<PostController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        switch (controller.pageState()) {
          case PageState.initial:
            return const Center(
              child: Text("initial.."),
            );
          case PageState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PageState.loaded:
            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                final postData = controller.posts[index];
                return ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(postData.title),
                  subtitle: Text(postData.body),
                );
              },
            );
          case PageState.failed:
            return const Icon(
              Icons.not_accessible,
              color: Colors.red,
              size: 60,
            );
        }
      }),
    );
  }
}
