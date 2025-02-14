import 'package:flutter/material.dart';

import 'package:newss_app/widgets/news_view_Builder.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category}); 
  // هنا في الـ constructor بنأخذ الـ category كـ parameter علشان نعرض الأخبار الخاصة بالفئة دي.

  final String category; // المتغير ده بيخزن اسم الفئة المختارة (مثلاً sports أو technology).

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      // Scaffold هنا بيوفر لك الهيكل الأساسي للصفحة زي الـ AppBar و الـ body.


        backgroundColor: const Color.fromARGB(222, 255, 255, 255), 
        // لون خلفية الشاشة اللي برا.



      appBar: AppBar( 
        automaticallyImplyLeading: false, // ده بيعطل الزر الافتراضي للرجوع (اللي بيظهر على الشمال).
        title: const Text(
          "Top News", 
          style: TextStyle(
            fontSize: 30, 
            fontFamily: 'Yatra One', 
            fontWeight: FontWeight.bold
          ),
        ),
        // هنا بنعرض عنوان الـ AppBar "Top News" مع تغييرات في الحجم والخط.

        leading: IconButton( 
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 40,), 
          // هنا الأيقونة بتاعة الرجوع اللي هتظهر على الشمال.

          onPressed: () { 
            Navigator.pop(context); 
            // لما المستخدم يضغط على الأيقونة دي، هيرجع للصفحة السابقة.
          },
        ),
      ),
      


      body: CustomScrollView( 
        // CustomScrollView هنا بتسمح بالتمرير لعرض الأخبار.

        slivers: [
          NewsListViewBuilder(
            category: category, 
            // هنا بنمرر الـ category علشان نعرض الأخبار الخاصة بالفئة دي.
          ),
        ],
      ),
    );
  }
}
