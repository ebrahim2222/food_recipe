import 'package:recipe_test_app/model/recipe.dart';

abstract class IDatabaseService {
  Future<void> initDatabase();

  Future<List<RecipeModel>> getFavourite();

  Future<void> addFavourite(RecipeModel recipeModel);

  Future<void> deleteFavourite(RecipeModel recipeModel);

  bool checkFavourite(RecipeModel recipeModel);
}
