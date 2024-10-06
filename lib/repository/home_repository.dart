import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/api/api_service.dart';
import 'package:recipe_test_app/contract/remote/i_home_repository.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/utils/helper/server_error.dart';
import 'package:recipe_test_app/utils/values/end_point_manager.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  @override
  Future<Either<Failure, List<RecipeModel>>> getHomeRecipe() async {
    try {
      final response = await APIService.instance.request(
        EndPointManager.home,
        DioMethod.get,
      );
      List<RecipeModel> recipeModel = [];
      for (var element in response.data) {
        recipeModel.add(RecipeModel.fromJson(element));
      }
      return Right(recipeModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
