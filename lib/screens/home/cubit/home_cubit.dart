import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_connection_service.dart';
import 'package:recipe_test_app/contract/local/i_database_service.dart';
import 'package:recipe_test_app/contract/local/i_message_service.dart';
import 'package:recipe_test_app/contract/local/i_navigation_service.dart';
import 'package:recipe_test_app/contract/remote/i_home_repository.dart';
import 'package:recipe_test_app/model/recipe.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final INavigationService navigationService;
  final IMessageService messageService;
  final IConnectionService connectionService;
  final IHomeRepository homeRepository;
  final IDatabaseService databaseService;
  HomeCubit(
      {required this.navigationService,
      required this.messageService,
      required this.connectionService,
      required this.homeRepository,
      required this.databaseService})
      : super(HomeState());

  Future<void> getHomeData() async {
    databaseService.initDatabase();

    var isConnected = await connectionService.checkConnection();
    if (!isConnected) {
      emit(state.copyWith(
          homeStatus: HomeStatus.failure, error: "No Internet Connection"));
      messageService.noInternetConnectionAlert();
      return;
    }
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    var homeRecipe = await homeRepository.getHomeRecipe();
    homeRecipe.fold((l) {
      emit(state.copyWith(
          error: l.message.toString(), homeStatus: HomeStatus.failure));
    }, (r) {
      emit(state.copyWith(
        recipeModel: r,
        homeStatus: HomeStatus.success,
      ));
    });
  }

  Future<void> addItemToFavourite(RecipeModel recipeModel) async {
    if (checkFavourite(recipeModel)) {
      databaseService.deleteFavourite(recipeModel);
      emit(state.copyWith());
      return;
    }
    databaseService.addFavourite(recipeModel);
    emit(state.copyWith());
  }

  bool checkFavourite(RecipeModel recipeModel) {
    return databaseService.checkFavourite(recipeModel);
  }
}
