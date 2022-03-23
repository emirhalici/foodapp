import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/models/meal_model.dart';

class IngredientList extends StatelessWidget {
  MealModel mealModel;
  IngredientList({Key? key, required this.mealModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> list = [];
    for (int i = 0; i < mealModel.ingredients.length; i++) {
      list.add(ListTile(
        leading: Text(mealModel.ingredients[i]),
        trailing: Text(mealModel.ingredientMeasures[i]),
      ));
    }
    return SingleChildScrollView(
      child: Column(
        children: list,
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  MealModel mealModel;
  FoodCard({Key? key, required this.mealModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < mealModel.ingredients.length; i++) {
      list.add(ListTile(
        leading: Text(mealModel.ingredients[i]),
        trailing: Text(mealModel.ingredientMeasures[i]),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 0),
                )
              ],
            ),
            child: Card(
              color: Theme.of(context).brightness == Brightness.dark ? Color(0xAA393f41) : Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: InkWell(
                splashColor: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        mealModel.meal,
                        style: TextStyle(fontSize: 32.sp),
                        textAlign: TextAlign.center,
                      ),
                      Image.network(mealModel.image),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
