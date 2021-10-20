import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/new_controller.dart';
import 'package:newsapp/view/widget/new_card.dart';

class HomeView extends GetWidget<NewsController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("NEWS"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          switch (controller.state.value) {
            case PageState.initial:
              return const CircularProgressIndicator();
            case PageState.loaded:
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final articleData = controller.articles[index];
                  return NewsCard(
                      title: articleData.title,
                      imageUrl: articleData.urlToImage,
                      publishedAt: articleData.publishedAt);
                },
              );
            case PageState.error:
              return const Text("Error");
            case PageState.loading:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
