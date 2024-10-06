// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'recipe.g.dart';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class RecipeModel {
  @HiveField(0)
  String? id;
  String? fats;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? time;
  @HiveField(3)
  String? image;
  List<String>? weeks;
  String? carbos;
  String? fibers;
  String? country;
  String? calories;
  String? headline;
  List<String>? keywords;
  List<String>? products;
  String? proteins;
  @HiveField(4)
  int? favorites;
  int? difficulty;
  @HiveField(5)
  String? description;
  bool? highlighted;
  @HiveField(6)
  List<String>? ingredients;
  dynamic incompatibilities;
  List<String>? deliverableIngredients;
  List<dynamic>? undeliverableIngredients;

  RecipeModel({
    this.id,
    this.fats,
    this.name,
    this.time,
    this.image,
    this.weeks,
    this.carbos,
    this.fibers,
    this.country,
    this.calories,
    this.headline,
    this.keywords,
    this.products,
    this.proteins,
    this.favorites,
    this.difficulty,
    this.description,
    this.highlighted,
    this.ingredients,
    this.incompatibilities,
    this.deliverableIngredients,
    this.undeliverableIngredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        fats: json["fats"],
        name: json["name"],
        time: json["time"],
        image: json["image"],
        weeks: json["weeks"] == null
            ? []
            : List<String>.from(json["weeks"]!.map((x) => x)),
        carbos: json["carbos"],
        fibers: json["fibers"],
        country: json["country"],
        calories: json["calories"],
        headline: json["headline"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        products: json["products"] == null
            ? []
            : List<String>.from(json["products"]!.map((x) => x)),
        proteins: json["proteins"],
        favorites: json["favorites"],
        difficulty: json["difficulty"],
        description: json["description"],
        highlighted: json["highlighted"],
        ingredients: json["ingredients"] == null
            ? []
            : List<String>.from(json["ingredients"]!.map((x) => x)),
        incompatibilities: json["incompatibilities"],
        deliverableIngredients: json["deliverable_ingredients"] == null
            ? []
            : List<String>.from(json["deliverable_ingredients"]!.map((x) => x)),
        undeliverableIngredients: json["undeliverable_ingredients"] == null
            ? []
            : List<dynamic>.from(
                json["undeliverable_ingredients"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fats": fats,
        "name": name,
        "time": time,
        "image": image,
        "weeks": weeks == null ? [] : List<dynamic>.from(weeks!.map((x) => x)),
        "carbos": carbos,
        "fibers": fibers,
        "country": country,
        "calories": calories,
        "headline": headline,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "proteins": proteins,
        "favorites": favorites,
        "difficulty": difficulty,
        "description": description,
        "highlighted": highlighted,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "incompatibilities": incompatibilities,
        "deliverable_ingredients": deliverableIngredients == null
            ? []
            : List<dynamic>.from(deliverableIngredients!.map((x) => x)),
        "undeliverable_ingredients": undeliverableIngredients == null
            ? []
            : List<dynamic>.from(undeliverableIngredients!.map((x) => x)),
      };

  @override
  String toString() {
    return '$name: $id: $image: $time: $favorites: $description: $ingredients';
  }
}
