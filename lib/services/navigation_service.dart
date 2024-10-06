import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_navigation_service.dart';

@Singleton(as: INavigationService)
class NavigationService extends INavigationService {
  @override
  Future<T?> popAllUntill<T>(String stopConditionRoute, {args}) {
    return Get.offNamed(stopConditionRoute) as Future<T>;
  }

  @override
  void popRoute<T>({T? result}) {
    return Get.back(result: result);
  }

  @override
  Future<T?> pushRoute<T>(String newRouteName, {args}) {
    return Get.toNamed(newRouteName, arguments: args, preventDuplicates: true)
        as Future<T>;
  }

  @override
  void offNamed({required String route, args}) {
    Get.offNamed(route, arguments: args);
  }

  @override
  void offAllNamed({required String route}) {
    Get.offAllNamed(route);
  }
}
