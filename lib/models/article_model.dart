class ArticleModel {
  final String? image; // الصورة بتاعة المقال، ده اختياري يعني ممكن مفيش صورة.
  final String title; // العنوان الرئيسي بتاع المقال، ده لازم يتكتب.
  final String? subTitle; // العنوان الفرعي، ده مش لازم يعني ممكن مفيش.
  final String? url; // الرابط للمقال الكامل، ده اختياري يعني ممكن مفيش.

  // الـ Constructor بيستقبل المعاملات دي علشان يخلق كائن من الـ ArticleModel.
  ArticleModel({required this.image, required this.title, required this.subTitle, required this.url});
}
