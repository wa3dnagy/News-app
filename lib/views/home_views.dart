import 'package:flutter/material.dart';

import 'package:newss_app/widgets/categories_list_view.dart';
import 'package:newss_app/widgets/news_view_Builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(222, 255, 255, 255),
      // لون خلفية الشاشة اللي برا.
    
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        // هنا بتحدد ارتفاع الـ AppBar عشان يبقى أطول شوية.

        child: AppBar(
          flexibleSpace: Stack(
            children: [
              // هنا بنضيف Container اللي بيحتوي على خلفية متدرجة
              Container(
                decoration: const BoxDecoration(
                  // بنستخدم LinearGradient علشان نعمل تأثير التدرج اللوني
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 11, 1, 67),
                      Color.fromARGB(255, 91, 3, 3),
                    ],
                    begin: Alignment.topLeft, // بداية التدرج من فوق علي الشمال
                    end:
                        Alignment.bottomRight, // نهاية التدرج من تحت علي اليمين
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                // هنا بتحط النص والأيقونة في نص الـ AppBar من تحت.

                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // بيخلي النص والأيقونة في نص السطر.

                    children: [
                      Text(
                        'World News ',
                        // ده العنوان الرئيسي للشاشة.

                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(222, 255, 255, 255 ),
                          fontFamily: 'Yatra One',
                        ),
                      ),
                      Icon(Icons.public,
                          color: Color.fromARGB(233, 255, 255, 255), size: 40),
                      // دي أيقونة الكرة الأرضية اللي جنب العنوان.
                    ],
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
          // بيضيف شادو تحت الـ AppBar عشان يبان بارز.

          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // لفتح الـ Drawer عند الضغط
              },
            );
          }),
        ),
      ),

      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        // هنا بتحط فراغات صغيرة يمين وشمال الشاشة.

        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          // الحركة المرنة لما تسحب الشاشة فوق وتحت.

          slivers: [
            SliverToBoxAdapter(
              child: Center(child: CategoriesListview()),
              // دي بتعرض الأقسام زي (رياضة - سياسة).
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                // فراغ بين أقسام الشاشة.
              ),
            ),
            NewsListViewBuilder(
              category: 'general',
              // دي بتعرض الأخبار للقسم العام.
            ),
          ],
        ),
      ),
    );
  }
}
