import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipe_test_app/components/recipe_item.dart';
import 'package:recipe_test_app/constants.dart';
import 'package:recipe_test_app/main.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/routes/routes_manager.dart';
import 'package:recipe_test_app/screens/home/cubit/home_cubit.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<HomeCubit>()..getHomeData(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            elevation: 0,
            title: Text(
              'Recipes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.toNamed(RoutesManager.favouriteRoute);
                },
              ),
            ],
          ),
          body: const _Body(),
        ));
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      switch (state.homeStatus) {
        case HomeStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case HomeStatus.failure:
          return Center(child: Text(state.error.toString()));
        case HomeStatus.success:
          return SizedBox(
            width: context.width,
            height: context.height,
            child: GridView.builder(
              itemBuilder: (context, index) {
                return CardContainer(index: index);
              },
              itemCount: state.recipeModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: AppPadding.p10,
                  crossAxisSpacing: AppPadding.p10,
                  crossAxisCount: 2),
            ),
          );
      }
    });
  }
}

class CardContainer extends StatelessWidget {
  final int index;
  const CardContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final state = context.read<HomeCubit>().state;
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesManager.detailsRoute,
            arguments: state.recipeModel[index]);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          RecipeItem(recipeModel: state.recipeModel[index]),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: _ArrowIcon(
                icon: Icons.favorite,
                onTap: () {
                  context
                      .read<HomeCubit>()
                      .addItemToFavourite(state.recipeModel[index]);
                },
                item: state.recipeModel[index]),
          ),
        ],
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final RecipeModel item;
  const _ArrowIcon({this.onTap, required this.icon, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: WidgetWidth.w40,
        height: WidgetHeight.h40,
        decoration: BoxDecoration(
          color: ColorManager.lightTextPrimary,
          shape: BoxShape.circle,
          boxShadow: [shadow],
        ),
        child: Icon(
          icon,
          color: context.watch<HomeCubit>().checkFavourite(item)
              ? ColorManager.secondary
              : Colors.white,
        ),
      ),
    );
  }
}
