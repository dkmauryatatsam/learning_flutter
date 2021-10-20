import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/new_controller.dart';
import 'package:newsapp/widget/new_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("NEWS"),
          centerTitle: true,
        ),
        body: Obx(() {
          if (newsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: newsController.newsList.length,
            itemBuilder: (context, index) {
              final data = newsController.newsList[index];
              return NewsCard(
                  title: data.title,
                  imageUrl: data.urlToImage,
                  publishedAt: data.publishedAt);
            },
          );
        }));
  }
}
