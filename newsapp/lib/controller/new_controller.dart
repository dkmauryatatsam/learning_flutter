import 'package:get/get.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/api_service.dart';

enum PageState { initial, loaded, error, loading }

class NewsController extends GetxController {
  final RxList<Article> _articles = RxList([]);
  List<Article> get articles => _articles;
  Rx<PageState> state = Rx(PageState.initial);
  final ApiService apiService = Get.find();

  @override
  void onInit() {
    fetchArticle();
    super.onInit();
  }

  void fetchArticle() async {
    state(PageState.loading);
    try {
      final article = await apiService.getArticle();
      _articles.value = article;
      state(PageState.loaded);
    } catch (e) {
      state(PageState.error);
    }
  }
}
