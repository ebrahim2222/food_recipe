import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_test_app/routes/routes_manager.dart';
import 'package:recipe_test_app/utils/values/assets_manager.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/const_strings.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: ConstStrings.introPage1Title,
        body: ConstStrings.introPage1Body,
        image: Center(
          child: Lottie.asset(JsonAssets.recipeBook),
        ),
        decoration: pageDecoration(context),
      ),
      PageViewModel(
        title: ConstStrings.introPage2Title,
        body: ConstStrings.introPage2Body,
        image: Center(
          child: Lottie.asset(JsonAssets.wonderingWoman),
        ),
        decoration: pageDecoration(context),
      ),
      PageViewModel(
        title: ConstStrings.introPage3Title,
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ConstStrings.clickOn,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(Icons.arrow_forward),
            Text(
              ConstStrings.buttonToGetStarted,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        image: Center(
          child: Lottie.asset(
            JsonAssets.chef,
          ),
        ),
        decoration: pageDecoration(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: getPages(),
      onDone: () async {
        Get.offNamed(RoutesManager.loginRoute);
      },
      showSkipButton: true,
      skip: Text(
        ConstStrings.skip,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: ColorManager.primary,
      ),
      done: const Icon(
        Icons.arrow_forward,
        color: ColorManager.primary,
      ),
      dotsDecorator: DotsDecorator(
        size: Size(WidgetWidth.w10, WidgetHeight.h10),
        color: ColorManager.primary,
        activeSize: Size(WidgetWidth.w10, WidgetHeight.h10),
        activeColor: ColorManager.secondary,
        activeShape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(WidgetBorderRadius.b24)),
        ),
      ),
    );
  }
}

PageDecoration pageDecoration(context) {
  return PageDecoration(
    pageColor: Colors.white,
    bodyTextStyle: Theme.of(context).textTheme.bodyLarge!,
    titleTextStyle: Theme.of(context).textTheme.titleMedium!,
  );
}
