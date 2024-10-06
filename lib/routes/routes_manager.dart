import 'package:flutter/material.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/screens/details/details_screen.dart';
import 'package:recipe_test_app/screens/favorites/favorite_screen.dart';
import 'package:recipe_test_app/screens/home/home_screen.dart';
import 'package:recipe_test_app/screens/intro/intro_screen.dart';
import 'package:recipe_test_app/screens/login/login_screen.dart';

class RoutesManager {
  static const String introRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
  static const String favouriteRoute = "/favourite";
}

class RouteGenetator {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.introRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesManager.favouriteRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case RoutesManager.detailsRoute:
        RecipeModel args = settings.arguments as RecipeModel;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  recipeModel: args,
                ),
            settings: settings);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('No Route'),
          ),
          body: const Center(child: Text("No Route")),
        );
      },
    );
  }
}
