part of 'home_cubit.dart';

enum HomeStatus { loading, failure, success }

class HomeState {
  final HomeStatus homeStatus;
  final List<RecipeModel> recipeModel;
  final String error;
  HomeState(
      {this.homeStatus = HomeStatus.loading,
      this.recipeModel = const [],
      this.error = ""});

  HomeState copyWith(
      {String? error, HomeStatus? homeStatus, List<RecipeModel>? recipeModel}) {
    return HomeState(
        homeStatus: homeStatus ?? this.homeStatus,
        recipeModel: recipeModel ?? this.recipeModel,
        error: error ?? this.error);
  }
}
