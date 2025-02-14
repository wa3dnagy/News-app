class CategoryModel {
  final String image; // دي هتخزن رابط الصورة بتاعت الكاتيجوري.
  final String categoryName; // دي هتخزن اسم الكاتيجوري (زي "Sports" أو "Business").

  // الـ Constructor هنا هياخد المتغيرات دي علشان يعمل الـ instance من الـ CategoryModel.
  const CategoryModel({required this.image, required this.categoryName});
}
