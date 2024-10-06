import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_connection_service.dart';
import 'package:recipe_test_app/contract/local/i_database_service.dart';
import 'package:recipe_test_app/contract/local/i_message_service.dart';
import 'package:recipe_test_app/contract/local/i_navigation_service.dart';
import 'package:recipe_test_app/contract/remote/i_home_repository.dart';
import 'package:recipe_test_app/model/recipe.dart';

part 'details_state.dart';

@Injectable()
class DetailsCubit extends Cubit<DetailsState> {
  final INavigationService navigationService;
  final IMessageService messageService;
  final IConnectionService connectionService;
  final IHomeRepository homeRepository;
  final IDatabaseService databaseService;
  DetailsCubit(
      {required this.navigationService,
      required this.messageService,
      required this.connectionService,
      required this.homeRepository,
      required this.databaseService})
      : super(DetailsInitial());
  RecipeModel? _recipeModel;
  RecipeModel get recipeModel => _recipeModel!;
  void getPassedData() {
    final args = Get.arguments;
    if (args == null) Get.back();

    _recipeModel = args["details"] as RecipeModel;
  }

  Future<void> addItemToFavourite(RecipeModel recipeModel) async {
    if (checkFavourite(recipeModel)) {
      databaseService.deleteFavourite(recipeModel);
      emit(state);
      return;
    }
    databaseService.addFavourite(recipeModel);
    emit(state);
  }

  bool checkFavourite(RecipeModel recipeModel) {
    databaseService.initDatabase();

    return databaseService.checkFavourite(recipeModel);
  }
}
