
import 'package:flutter/material.dart';
import 'package:newss_app/models/article_model.dart';

import 'package:newss_app/widgets/news_tile.dart';

List<ArticleModel> article=[]; // دي قائمة هتخزن المقالات اللي هنجيبها من الـ API أو من مصدر تاني.

class NewsListView extends StatelessWidget {
  final List<ArticleModel> article; // هنا الكلاس بيستقبل قائمة المقالات اللي هنعرضها.

  // الكونستركتور ده بيستقبل المقالات وبيمررها للكلاس عشان نعرضها
  NewsListView({super.key, required this.article}); 

  @override
  Widget build(BuildContext context) {
    return SliverList(
      // بنستخدم SliverList علشان نعرض البيانات في شكل سلايدر قابل للتمرير، وهنا بيتم استخدام SliverChildBuilderDelegate 
      // لتوليد العناصر الموجودة في الـ List
      delegate: SliverChildBuilderDelegate(
        childCount: article.length, // بنحدد عدد العناصر اللي هنضيفها حسب طول الـ article
        (context, index) {
          return Padding(
            // بنضيف padding علشان نسيب مسافة بين المقالات
            padding: const EdgeInsets.only(bottom: 15),
            child: NewsTile(
              // بنعرض الـ NewsTile اللي هو widget تاني هنعرض فيه تفاصيل المقال
              articleModel: article[index], 
            ),
          );
        }
      ),
    );
  }
}





