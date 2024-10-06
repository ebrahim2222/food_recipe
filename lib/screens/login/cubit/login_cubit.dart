import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_connection_service.dart';
import 'package:recipe_test_app/contract/local/i_message_service.dart';
import 'package:recipe_test_app/contract/local/i_navigation_service.dart';
import 'package:recipe_test_app/routes/routes_manager.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final IMessageService messageService;
  final IConnectionService connectionService;
  final INavigationService navigationService;

  LoginCubit(
      {required this.messageService,
      required this.connectionService,
      required this.navigationService})
      : super(LoginInitial());

  void goToHome() {
    navigationService.offNamed(route: RoutesManager.homeRoute);
  }
}
