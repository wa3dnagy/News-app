import 'package:flutter/material.dart';
import 'package:newss_app/models/category_model.dart';
import 'package:newss_app/widgets/category_card.dart';

class CategoriesListview extends StatelessWidget {
  // هنا بإنشئ قائمة (list) من الـ Categories، كل واحدة فيها صورة واسم للفئة
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/Business.jpeg', categoryName: 'Business'), // فئة الأعمال
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'), // فئة التكنولوجيا
    CategoryModel(image: 'assets/sport.jpeg', categoryName: 'Sports'), // فئة الرياضة
    CategoryModel(image: 'assets/entertaiment.jpeg', categoryName: 'Entertainment'), // فئة الترفيه
    CategoryModel(image: 'assets/science.jpeg', categoryName: 'Science'), // فئة العلوم
    CategoryModel(image: 'assets/health.jpeg', categoryName: 'Health'), // فئة الصحة
    CategoryModel(image: 'assets/general.avif', categoryName: 'General'), // فئة عامة
  ];

  const CategoriesListview({super.key}); // بيعمل constructor للـ widget

  @override
  Widget build(BuildContext context) {
    // هنا بعمل SizedBox علشان أتحكم في ارتفاع الـ ListView
    return SizedBox(
      height: 120, // تحديد الارتفاع للـ ListView اللي هتكون أفقي
      child: ListView.builder(
        // هنا بنحدد الـ scroll direction إنها تكون أفقية (Horizontal)
        scrollDirection: Axis.horizontal, 
        itemCount: categories.length, // بيحدد عدد العناصر اللي هتظهر في الـ ListView حسب عدد الـ categories
        itemBuilder: (context, index) {
          // هنا كل عنصر بيتم بناؤه في الـ ListView باستخدام الـ Categorycard
          return Categorycard(
            category: categories[index], // بيبعت الـ Category لكل كارت علشان يعرضه
          );
        },
      ),
  
      
    );

    
  } 
  
}