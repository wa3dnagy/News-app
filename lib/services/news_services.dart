import 'package:dio/dio.dart';
import 'package:newss_app/models/article_model.dart';

class NewsServices {
  final Dio dio;
  // هنا بنعرف متغير من نوع Dio عشان نقدر نعمل بيه الطلبات.

  NewsServices(this.dio);
  // ده الكونستركتور اللي بيستقبل الـ Dio اللي هنستخدمه عشان نعمل طلبات HTTP.

  Future<List<ArticleModel>> getNews({required String category}) async {
    // دي الدالة اللي هترجع لك قائمة من المقالات (ArticleModel)، هتاخد منها فئة الأخبار (category) زي رياضة أو سياسة.

    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=01215d507cf4425d83e4d3a134df8e7b&category=$category'
          // بنعمل طلب GET باستخدام Dio وندخل الـ URL الخاص بـ API الأخبار مع إضافة الـ category اللي جاي من الـ input.

          );
      Map<String, dynamic> jsonData = response.data;
      // هنا بنحول الرد بتاع الـ API اللي وصلنا له من JSON إلى Map عشان نقدر نشتغل عليه.

      List<dynamic> articles = jsonData['articles'];
      // بنسحب الأخبار من الـ JSON باستخدام الـ key 'articles' اللي بيحتوي على كل المقالات.

      List<ArticleModel> articlesList = [];
      // بنعمل List جديدة هتخزن المقالات اللي هتحولها لـ ArticleModel عشان تبقى جاهزة للاستخدام في التطبيق.

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
          url: article['url'],
        );
        articlesList.add(articleModel);
        // بنضيف الـ ArticleModel اللي اتحولناه في الـ List عشان نرجعها في النهاية.
      }
      return articlesList;
      // في الآخر بنرجع الـ List دي عشان نقدر نعرضها في واجهة المستخدم.
    } catch (e) {
      return [];
      // لو حصل خطأ في الطلب أو في التعامل مع الـ API بنرجع قائمة فاضية.
    }
  }
}
