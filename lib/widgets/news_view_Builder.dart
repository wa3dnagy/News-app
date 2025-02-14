import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/models/article_model.dart';
import 'package:newss_app/services/news_services.dart';
import 'package:newss_app/widgets/news_list_view.dart';


class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category}); 
  // ده Constructor لويدجت NewsListViewBuilder اللي بياخد category كـ مدخل

  final String category; // هنا بنخزن اسم الفئة (Category) اللي هنجيب الأخبار ليها
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState(); 
  // بنحدد الحالة بتاعت الـ Widget دي
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future; // متغير هنستخدمه لتخزين الـ Future اللي بيرجع الأخبار

  @override
  void initState() {
    super.initState();
    // هنا بننادي على خدمة الأخبار NewsServices علشان تجيب الأخبار بناءً على الـ category
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future, // بنحدد الـ Future اللي هيجيب الأخبار
      builder: (context, snapshot) {
        snapshot.data; // هنا بيفحص البيانات اللي جاية من الـ Future
        if (snapshot.hasData) { 
          // لو البيانات جت بنعرض الأخبار باستخدام NewsListView
          return NewsListView(article: snapshot.data!);
        } else if (snapshot.hasError) {
          // لو في مشكلة أو خطأ، بنعرض رسالة الخطأ
          return const SliverToBoxAdapter(
            child: Text('oops there are an error, pls try later')
          );
        } else {
          // لو البيانات لسه مش جاهزة، بنعرض Spinner لغاية ما البيانات تجي
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 3, 45, 117),
              ),
            ),
          );
        }
      }
    );
  }
}
