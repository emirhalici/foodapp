import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/models/meal_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MainProvider with ChangeNotifier {
  void addMeal(MealModel meal) {
    mealModels.add(meal);
    notifyListeners();
  }

  List<MealModel> mealModels = [
    // MealModel(
    //   id: 52772,
    //   meal: "Teriyaki Chicken Casserole",
    //   category: "Chicken",
    //   area: "Japanese",
    //   instructions:
    //       "Preheat oven to 350\u00b0 F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, \u00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!",
    //   image: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
    //   youtube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
    //   tags: ["Meat,Casserole"],
    //   ingredients: [
    //     "soy sauce",
    //     "water",
    //     "brown sugar",
    //     "ground ginger",
    //     "minced garlic",
    //     "cornstarch",
    //     "chicken breasts",
    //     "stir-fry vegetables",
    //     "brown rice",
    //   ],
    //   ingredientMeasures: [
    //     "3/4 cup",
    //     "1/2 cup",
    //     "1/4 cup",
    //     "1/2 teaspoon",
    //     "1/2 teaspoon",
    //     "4 Tablespoons",
    //     "2",
    //     "1 (12 oz.)",
    //     "3 cups",
    //   ],
    // ),
    // MealModel(
    //   id: 52919,
    //   meal: "Fennel Dauphinoise",
    //   category: "Side",
    //   area: "French",
    //   instructions:
    //       "Heat oven to 180C/160C fan/gas 4. Put potatoes, fennel, and garlic in a medium non-stick pan. Pour in milk and double cream, season well and simmer gently, covered, for 10 mins, stirring halfway through, until potatoes are just tender.\r\nDivide the mixture between 2 small (about 150ml) buttered ramekins and scatter with Parmesan. Bake for 40 mins until the potatoes are golden and tender when pierced with a knife. Snip the reserved fennel fronds over before serving.",
    //   image: "https://www.themealdb.com/images/media/meals/ytttsv1511798734.jpg",
    //   youtube: "https://www.youtube.com/watch?v=tXBzZm2kkh8",
    //   tags: ["Pie", "SideDish"],
    //   ingredients: [
    //     "Potatoes",
    //     "Fennel",
    //     "Garlic",
    //     "Milk",
    //     "Double Cream",
    //     "Butter",
    //     "Parmesan Cheese",
    //   ],
    //   ingredientMeasures: [
    //     "225g",
    //     "1 small",
    //     "1 clove finely chopped",
    //     "75 ml ",
    //     "100ml",
    //     "For Greasing",
    //     "to serve",
    //   ],
    // )
  ];
}
