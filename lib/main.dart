
import 'package:flutter/material.dart';

import 'package:newss_app/views/home_views.dart';

void main() {
  
  runApp(const NewsApp ());
}

 





class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
    
  }
}
