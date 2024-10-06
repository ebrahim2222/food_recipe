import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_database_service.dart';
import 'package:recipe_test_app/model/recipe.dart';

@Injectable(as: IDatabaseService)
class DatabaseRepository implements IDatabaseService {
  late Box<RecipeModel> recipeBox;
  final String recipeBoxName = 'recipes';
  @override
  Future<void> addFavourite(RecipeModel recipeModel) async {
    await recipeBox.put('${recipeModel.id}', recipeModel);
  }

  @override
  Future<void> deleteFavourite(RecipeModel recipeModel) async {
    await recipeBox.delete('${recipeModel.id}');
  }

  @override
  Future<List<RecipeModel>> getFavourite() async {
    return recipeBox.values.toList();
  }

  @override
  Future<void> initDatabase() async {
    if (Hive.isBoxOpen(recipeBoxName)) {
      recipeBox = Hive.box<RecipeModel>(recipeBoxName);
    } else {
      recipeBox = await Hive.openBox<RecipeModel>(recipeBoxName);
    }
  }

  @override
  bool checkFavourite(RecipeModel recipeModel) {
    if (recipeBox.containsKey(recipeModel.id)) {
      return true;
    }
    return false;
  }
}
