import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/home_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SuperHeroes',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.HOME,
      
      
    );
  }
}
