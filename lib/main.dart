import 'package:flutter/material.dart';
import 'package:flutter_np_app_design_test_1/screen/fruit_nutrition_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Np App Design UI',
      debugShowCheckedModeBanner: false,
      home: FruitNutritionScreen(),
    );
  }
}
