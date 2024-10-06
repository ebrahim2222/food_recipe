import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_test_app/components/network_image_widget.dart';
import 'package:recipe_test_app/constants.dart';
import 'package:recipe_test_app/extension/media_query.dart';
import 'package:recipe_test_app/main.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/screens/details/cubit/details_cubit.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class DetailsScreen extends StatelessWidget {
  final RecipeModel? recipeModel;
  const DetailsScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DetailsCubit>(), child: _Body(recipeModel));
  }
}

class _Body extends StatelessWidget {
  final RecipeModel? recipeModel;
  const _Body(this.recipeModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    NetworkImageWidget(
                      image: recipeModel?.image ?? '',
                      width: context.width,
                      height: context.height * 0.35,
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p10),
                      child: _ArrowIcon(
                        icon: Icons.favorite,
                        item: recipeModel!,
                        onTap: () {
                          context
                              .read<DetailsCubit>()
                              .addItemToFavourite(recipeModel!);
                        },
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: WidgetHeight.h10,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(recipeModel?.description ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: WidgetHeight.h10,
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox.adaptive(value: false, onChanged: (value) {}),
                      Text(recipeModel?.ingredients?[index] ?? '')
                    ],
                  );
                },
                itemCount: recipeModel?.ingredients?.length ?? 0,
              )
            ],
          ),
        ),
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
          color: context.watch<DetailsCubit>().checkFavourite(item)
              ? ColorManager.secondary
              : Colors.white,
        ),
      ),
    );
  }
}
