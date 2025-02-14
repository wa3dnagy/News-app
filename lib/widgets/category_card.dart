
import 'package:flutter/material.dart';
import 'package:newss_app/models/category_model.dart';
import 'package:newss_app/views/category_view.dart';

class Categorycard extends StatelessWidget {
  // هنا بنمرر الـ category كـ parameter علشان نعرض بيانات الفئة دي
  const Categorycard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // هنا بنعمل padding حوالي الكارت علشان نديه مساحة حوالين المحتوى
      padding: const EdgeInsets.only(right: 5, top: 20, left: 7),
      child: GestureDetector(
        // بنستخدم GestureDetector علشان نقدر نعمل تفاعل مع الكارت
        onTap: () {
          // لما الكارت يتضغط، هنروح على صفحة جديدة اللي هي CategoryView
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CategoryView(category: category.categoryName,); // بنمرر اسم الفئة
              },
            ),
          );
        },
        child: Card(
          elevation: 8, // هنا بضيف ظل للكارت علشان يظهر بشكل أفضل
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // بنعمل زاوية مدورة للكارت
          ),
          child: Container(
            height: 200, // تحديد ارتفاع الكارت
            width: 170, // تحديد عرض الكارت
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // هنا بنزيد الانحناء علشان الكارت يكون شكله أجمل
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26, // تحديد لون الظل
                  offset: Offset(0, 4), // تحديد مكان الظل تحت الكارت
                  blurRadius: 6, // تحديد مدى تشويش الظل
                ),
              ],
              image: DecorationImage(
                image: AssetImage(category.image), // هنا بنحط صورة الفئة
                fit: BoxFit.cover, // التأكد إن الصورة هتغطي المساحة بالكامل بدون تشويه
              ),
            ),
            child: Center(
              // النص بيتحط في المنتصف
              child: Text(
                category.categoryName, // هنا بنعرض اسم الفئة
                style: const TextStyle(
                  color: Colors.white,  
                  fontWeight: FontWeight.bold, // النص هيبقى بخط عريض
                  fontSize: 22, // حجم الخط
                  shadows: [
                    Shadow(
                      blurRadius: 5.0, // درجة تشويش الظل
                      color: Colors.black87, // لون الظل
                      offset: Offset(2.0, 2.0), // مكان الظل بالنسبة للنص
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
