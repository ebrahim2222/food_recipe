import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/main.config.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/routes/routes_manager.dart';
import 'package:recipe_test_app/screens/intro/intro_screen.dart';
import 'package:recipe_test_app/utils/values/theme_manager.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  _initHive();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Food Recipes',
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getApplicationLightTheme(),
          themeMode: ThemeMode.light,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            );
          },
          home: const IntroScreen(),
          initialRoute: RoutesManager.introRoute,
          onGenerateRoute: RouteGenetator.onGenerateRoute,
        );
      },
    );
  }
}
