import 'package:get/get.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/api_service.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  var isLoading = true.obs;
  ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchArticle();
    super.onInit();
  }

  void fetchArticle() async {
    try {
      isLoading(true);
      final article = await apiService.getArticle();
      if (article != null) {
        newsList.value = article;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
