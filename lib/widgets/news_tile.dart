import 'package:flutter/material.dart';
import 'package:newss_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';



class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel}); // هنا بيتم تمرير المقال نفسه من الـ API علشان نعرضه في الـ Widget
  final ArticleModel articleModel; // الـ articleModel ده بيحمل تفاصيل المقال.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector ده بيستجيب للأحداث زي النقر (Tap) على العنصر
      onTap: () async {
        final url = articleModel.url; // بنجيب الرابط الخاص بالمقال
        if (url != null && await canLaunchUrl(Uri.parse(url))) {
          // لو الرابط مش فارغ وبيقدر يفتح الرابط ده في متصفح خارجي
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
          // لو الرابط مش صالح أو مفيش رابط
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot open the link!')), // بيظهر رسالة تنبيه للمستخدم
          );
        }
      }, 
     child:  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // عشان الزوايا تكون مدورة
      ),
      elevation: 10, //Card تأثير الظل تحت الـ 
      margin: EdgeInsets.symmetric(vertical: 5 ,horizontal: 10), // Cardالمسافة بين الـC والعناصر الأخرى
      child: Padding(
        padding: const EdgeInsets.all(12), // Cardالمسافة الداخلية داخل الـ 
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20), // تقطيع الصورة بحيث تكون الزوايا مدورة
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.network(
                    articleModel.image?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZqzD_TF-YRtWqjivJDVzUCLqhR5fNWuipUw&s', 
                    // بنعرض الصورة من الإنترنت (لو مش موجودة بنعرض صورة بديلة)
                    height: 200, // ارتفاع الصورة
                    width: double.infinity, // Cardعرض الصورة 100% من الـ
                    fit: BoxFit.fill, // ملء المساحة بالصورة بدون تغيير الأبعاد
                  ),
                )),
            SizedBox(
              height: 60, //Text حجم الـ  الخاص بالعنوان
              child: Text(
                articleModel.title, // عنوان المقال
                maxLines: 2, // بنحدد عدد الأسطر المسموح بيها
                overflow: TextOverflow.ellipsis, // لو العنوان طويل بيظهر "..." في آخره
                style: const TextStyle(
                    color: Color.fromARGB(255, 32, 32, 32), // لون الخط
                    fontSize: 20, // حجم الخط
                    fontWeight: FontWeight.bold), // سمك الخط
              ),
            ),
            SizedBox(
              height: 40, // حجم الـ Text الخاص بالوصف
              child: Text(
                articleModel.subTitle??'', // لو الوصف مش موجود، نعرضه كـ فارغ
                style: const TextStyle(
                    color: Color.fromARGB(240, 114, 112, 112), // لون النص
                    fontSize: 14), // حجم الخط
              ),
            )
          ],
        ),
      ),
    ),);
  }
}
