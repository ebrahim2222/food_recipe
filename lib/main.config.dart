// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'contract/local/i_connection_service.dart' as _i844;
import 'contract/local/i_database_service.dart' as _i6;
import 'contract/local/i_message_service.dart' as _i482;
import 'contract/local/i_navigation_service.dart' as _i752;
import 'contract/remote/i_home_repository.dart' as _i653;
import 'repository/database_repository.dart' as _i132;
import 'repository/home_repository.dart' as _i517;
import 'screens/details/cubit/details_cubit.dart' as _i491;
import 'screens/favorites/cubit/favorite_cubit.dart' as _i9;
import 'screens/home/cubit/home_cubit.dart' as _i903;
import 'screens/login/cubit/login_cubit.dart' as _i1039;
import 'services/connection_service.dart' as _i860;
import 'services/message_service.dart' as _i806;
import 'services/navigation_service.dart' as _i912;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i844.IConnectionService>(() => _i860.ConnectionService());
  gh.singleton<_i482.IMessageService>(() => _i806.MessageService());
  gh.factory<_i653.IHomeRepository>(() => _i517.HomeRepository());
  gh.singleton<_i752.INavigationService>(() => _i912.NavigationService());
  gh.factory<_i6.IDatabaseService>(() => _i132.DatabaseRepository());
  gh.factory<_i9.FavoriteCubit>(
      () => _i9.FavoriteCubit(databaseService: gh<_i6.IDatabaseService>()));
  gh.factory<_i1039.LoginCubit>(() => _i1039.LoginCubit(
        messageService: gh<_i482.IMessageService>(),
        connectionService: gh<_i844.IConnectionService>(),
        navigationService: gh<_i752.INavigationService>(),
      ));
  gh.factory<_i903.HomeCubit>(() => _i903.HomeCubit(
        navigationService: gh<_i752.INavigationService>(),
        messageService: gh<_i482.IMessageService>(),
        connectionService: gh<_i844.IConnectionService>(),
        homeRepository: gh<_i653.IHomeRepository>(),
        databaseService: gh<_i6.IDatabaseService>(),
      ));
  gh.factory<_i491.DetailsCubit>(() => _i491.DetailsCubit(
        navigationService: gh<_i752.INavigationService>(),
        messageService: gh<_i482.IMessageService>(),
        connectionService: gh<_i844.IConnectionService>(),
        homeRepository: gh<_i653.IHomeRepository>(),
        databaseService: gh<_i6.IDatabaseService>(),
      ));
  return getIt;
}
