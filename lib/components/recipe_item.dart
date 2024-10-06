import 'package:flutter/material.dart';
import 'package:recipe_test_app/components/network_image_widget.dart';
import 'package:recipe_test_app/constants.dart';
import 'package:recipe_test_app/extension/media_query.dart';
import 'package:recipe_test_app/model/recipe.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/font_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class RecipeItem extends StatelessWidget {
  final RecipeModel recipeModel;
  const RecipeItem({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p10),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [shadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(WidgetBorderRadius.b10),
                topRight: Radius.circular(WidgetBorderRadius.b10),
              ),
              child: NetworkImageWidget(
                image: recipeModel.image ?? '',
                width: context.width * 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppPadding.p2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeModel.name ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: WidgetHeight.h2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: ColorManager.primary,
                        size: FontSizeManager.s12,
                      ),
                      SizedBox(
                        width: WidgetWidth.w2,
                      ),
                      Text(
                        recipeModel.time ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: FontSizeManager.s12),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
