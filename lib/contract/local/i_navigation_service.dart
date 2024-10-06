abstract class INavigationService {
  Future<T?> pushRoute<T>(String newRouteName, {dynamic args});

  void popRoute<T>({T? result});

  Future<T?> popAllUntill<T>(String stopConditionRoute, {dynamic args});

  void offNamed({required String route, dynamic args});
  void offAllNamed({required String route});
}
