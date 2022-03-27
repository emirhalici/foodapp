import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/components/food_card.dart';
import 'package:foodapp/helpers/api_helper.dart';
import 'package:foodapp/providers/main_provider.dart';
import 'package:provider/provider.dart';

import '../models/meal_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addRandomMeal() async {
    try {
      ApiHelper helper = ApiHelper();
      MealModel model = await helper.getRandomMeal();
      context.read<MainProvider>().addMeal(model);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    List<MealModel> meals = context.watch<MainProvider>().mealModels;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 32.0),
        onPressed: () {
          addRandomMeal();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: meals.map((meal) => FoodCard(mealModel: meal)).toList(),
        ),
      ),
    );
  }
}
