import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipe_test_app/components/recipe_item.dart';
import 'package:recipe_test_app/constants.dart';
import 'package:recipe_test_app/main.dart';
import 'package:recipe_test_app/routes/routes_manager.dart';
import 'package:recipe_test_app/screens/favorites/cubit/favorite_cubit.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteCubit>()..getFavourite(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'favourites',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavouriteState>(
        builder: (context, state) {
      switch (state.favouriteStatus) {
        case FavouriteStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case FavouriteStatus.failure:
          return Center(child: Text(state.error.toString()));
        case FavouriteStatus.success:
          return SizedBox(
            width: context.width,
            height: context.height,
            child: GridView.builder(
              itemBuilder: (context, index) {
                return _CardContainer(index: index);
              },
              itemCount: context.read<FavoriteCubit>().state.recipeModel.length,
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

class _CardContainer extends StatelessWidget {
  final int index;
  const _CardContainer({required this.index});

  @override
  Widget build(BuildContext context) {
    final state = context.read<FavoriteCubit>().state;
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
                    .read<FavoriteCubit>()
                    .removeFavourite(state.recipeModel[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  const _ArrowIcon({this.onTap, required this.icon});

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
          color: ColorManager.secondary,
        ),
      ),
    );
  }
}
