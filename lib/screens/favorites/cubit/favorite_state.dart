part of 'favorite_cubit.dart';

enum FavouriteStatus { loading, failure, success }

class FavouriteState {
  final FavouriteStatus favouriteStatus;
  final List<RecipeModel> recipeModel;
  final String error;
  FavouriteState(
      {this.favouriteStatus = FavouriteStatus.loading,
      this.recipeModel = const [],
      this.error = ""});

  FavouriteState copyWith(
      {String? error,
      FavouriteStatus? favouriteStatus,
      List<RecipeModel>? recipeModel}) {
    return FavouriteState(
        favouriteStatus: favouriteStatus ?? this.favouriteStatus,
        recipeModel: recipeModel ?? this.recipeModel,
        error: error ?? this.error);
  }
}
