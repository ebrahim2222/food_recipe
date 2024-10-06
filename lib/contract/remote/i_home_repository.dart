import 'package:dartz/dartz.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/utils/helper/server_error.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<RecipeModel>>> getHomeRecipe();
}
