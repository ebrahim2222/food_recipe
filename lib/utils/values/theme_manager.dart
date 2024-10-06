import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/font_manager.dart';
import 'package:recipe_test_app/utils/values/style_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class ThemeManager {
  static ThemeData getApplicationLightTheme() {
    return ThemeData(
        // main theme
        useMaterial3: false,
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.primary,
        primaryColorDark: ColorManager.secondary,
        disabledColor: ColorManager.grey,
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        // splashColor: ColorManager.lightPrimary,
        //card theme
        cardTheme: CardTheme(
            color: ColorManager.white,
            shadowColor: ColorManager.grey,
            elevation: FontSizeManager.s4),
        appBarTheme: AppBarTheme(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light),
            centerTitle: true,
            color: ColorManager.primary,
            elevation: FontSizeManager.s2,
            shadowColor: ColorManager.lightGrey,
            titleTextStyle: getMediumStyle(
                fontSize: FontSizeManager.s20, color: ColorManager.white)),
        buttonTheme: ButtonThemeData(
            shape: const StadiumBorder(),
            splashColor: ColorManager.grey,
            buttonColor: ColorManager.primary,
            disabledColor: ColorManager.grey),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                EdgeInsets.all(WidgetBorderRadius.b12),
              ),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return ColorManager.lightTextPrimary;
                }
                return ColorManager.backgroundColor;
              }),
              textStyle: WidgetStateProperty.all(getReqularStyle(
                  fontSize: FontSizeManager.s16, color: ColorManager.primary)),
              side: WidgetStateBorderSide.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: ColorManager.lightTextPrimary,
                  );
                }
                return BorderSide(
                    color: ColorManager.primary, width: AppSize.s1);
              }),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WidgetBorderRadius.b12),
              ))),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return ColorManager.lightTextPrimary;
              }
              return ColorManager.primary;
            }),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
              EdgeInsets.all(WidgetBorderRadius.b12),
            ),
            textStyle: WidgetStateProperty.all(getReqularStyle(
                fontSize: FontSizeManager.s16, color: ColorManager.white)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WidgetBorderRadius.b12),
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
            displayLarge: getSemiBoldStyle(
                color: ColorManager.headerFontColor,
                fontSize: FontSizeManager.s34),
            headlineLarge: getSemiBoldStyle(
                color: ColorManager.headerFontColor,
                fontSize: FontSizeManager.s30),
            headlineMedium: getExtraBoldStyle(
                color: ColorManager.defaultFontColor,
                fontSize: FontSizeManager.s28),
            titleLarge: getExtraBoldStyle(
                color: ColorManager.defaultFontColor,
                fontSize: FontSizeManager.s26),
            titleMedium: getMediumStyle(
                color: ColorManager.defaultFontColor,
                fontSize: FontSizeManager.s22),
            bodyLarge: getReqularStyle(
                color: ColorManager.darkGrey, fontSize: FontSizeManager.s18),
            bodySmall: getReqularStyle(
                color: ColorManager.grey, fontSize: FontSizeManager.s14)),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: getMediumStyle(
            color: ColorManager.textFieldBorderColor,
            fontSize: FontSizeManager.s16,
          ),
          labelStyle: getReqularStyle(
            color: ColorManager.black,
            fontSize: FontSizeManager.s12,
          ),
          isDense: true,
          filled: true,
          fillColor: ColorManager.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: AppSize.s1,
              color: ColorManager.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: AppSize.s1,
              color: ColorManager.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: AppSize.s1,
              color: ColorManager.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: AppSize.s1,
              color: ColorManager.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: AppSize.s1,
              color: ColorManager.textFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
          ),
        ),
        // radio button
        radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.all(ColorManager.secondary)),
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorManager.primary; // Checkbox is selected
            }
            return Colors.white; // Checkbox is unselected
          }),
          fillColor: WidgetStateProperty.all<Color?>(
            ColorManager.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                WidgetBorderRadius.b4), // Adjust the radius as needed
          ),
          splashRadius: 2,
          side: WidgetStateBorderSide.resolveWith((states) => BorderSide(
                color: ColorManager.primary,
                width: AppSize.s1,
              )),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: getMediumStyle(
                  color: ColorManager.textFieldBorderColor,
                  fontSize: FontSizeManager.s16,
                ),
                labelStyle: getReqularStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManager.s12,
                ),
                isDense: true,
                filled: true,
                fillColor: ColorManager.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: AppSize.s1,
                    color: ColorManager.textFieldBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(WidgetBorderRadius.b4),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  width: AppSize.s1,
                  color: ColorManager.textFieldBorderColor,
                )))));
  }
}
