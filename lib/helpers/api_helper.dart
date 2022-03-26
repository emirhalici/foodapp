import 'dart:convert';
import 'package:foodapp/models/ingredient_model.dart';
import 'package:http/http.dart' as http;

import '../models/meal_model.dart';

class ApiHelper {
  int key = 1;

  Future<MealModel> getRandomMeal() async {
    String urlString = 'https://www.themealdb.com/api/json/v1/$key/random.php';
    var url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw 'Response not found';
    }

    try {
      Map<String, dynamic> data = jsonDecode(response.body);
      var item = data['meals'][0];
      int id = int.parse(item['idMeal']);
      String meal = item['strMeal'];
      String category = item['strCategory'];
      String area = item['strArea'];
      String instructions = item['strInstructions'];
      String image = item['strMealThumb'] ?? '';
      String youtube = item['strYoutube'] ?? '';
      String tagsStr = item['strTags'] ?? '';
      List<String> tags = [];
      tags.addAll(tagsStr.split(','));
      List<String> ingredients = [];
      List<String> ingredientMeasures = [];
      for (var i = 1; i < 21; i++) {
        String ingredient = item['strIngredient$i'] ?? '';
        String ingredientMeasure = item['strMeasure$i'] ?? '';
        if (ingredient != '' && ingredientMeasure != '') {
          ingredients.add(ingredient);
          ingredientMeasures.add(ingredientMeasure);
        }
      }

      MealModel model = MealModel(
          id: id,
          meal: meal,
          category: category,
          area: area,
          instructions: instructions,
          image: image,
          youtube: youtube,
          tags: tags,
          ingredients: ingredients,
          ingredientMeasures: ingredientMeasures);
      return model;
    } catch (e) {
      throw 'Error while decoding response: ${e.toString()}';
    }
  }

  Future<List<IngredientModel>?> getAllIngredients() async {
    String urlString = 'https://www.themealdb.com/api/json/v1/$key/list.php?i=list';
    var url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw 'Response not found';
    }

    try {
      List<IngredientModel> list = [];
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var item in data['meals']) {
        int id = int.parse(item['idIngredient']);
        String ingredient = item['strIngredient'];
        String description = item['strDescription'] ?? '';
        String type = item['strType'] ?? '';

        IngredientModel model = IngredientModel(id: id, ingredient: ingredient, description: description, type: type);
        list.add(model);
      }
      return list;
    } catch (e) {
      throw 'Error while decoding response';
    }
  }
}
