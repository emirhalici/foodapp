class MealModel {
  final int id;
  final String meal, category, area, instructions, image, youtube;
  final List<String> tags;
  final List<String> ingredients;
  final List<String> ingredientMeasures;

  MealModel({
    required this.id,
    required this.meal,
    required this.category,
    required this.area,
    required this.instructions,
    required this.image,
    required this.youtube,
    required this.tags,
    required this.ingredients,
    required this.ingredientMeasures,
  });
}
