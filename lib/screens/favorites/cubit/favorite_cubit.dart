import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_database_service.dart';
import 'package:recipe_test_app/model/recipe.dart';

part 'favorite_state.dart';

@Injectable()
class FavoriteCubit extends Cubit<FavouriteState> {
  final IDatabaseService databaseService;
  FavoriteCubit({required this.databaseService}) : super(FavouriteState());

  Future<void> getFavourite() async {
    try {
      await databaseService.initDatabase();
      var favourite = await databaseService.getFavourite();
      emit(state.copyWith(
        favouriteStatus: FavouriteStatus.success,
        recipeModel: favourite,
      ));
    } catch (e) {
      emit(state.copyWith(
          favouriteStatus: FavouriteStatus.failure, error: e.toString()));
    }
  }

  Future<void> removeFavourite(RecipeModel recipeModel) async {
    await databaseService.initDatabase();
    await databaseService.deleteFavourite(recipeModel);
    getFavourite();
    emit(state.copyWith());
  }
}
