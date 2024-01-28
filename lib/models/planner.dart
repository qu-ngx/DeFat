import 'package:flutter/material.dart';
import 'food.dart';

class Planner extends ChangeNotifier {
  final List<Food> _foodList = [
    Food(
        label: "french_fries",
        name: "French Fries",
        imagePath: "assets/images/french-fries.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "sausage",
        name: "Sausage",
        imagePath: "assets/images/sausage.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "grilled_chicken",
        name: "Grilled Chicken",
        imagePath: "assets/images/grilled-chicken.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "fish",
        name: "Fish",
        imagePath: "assets/images/fish.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "scrambled_egg",
        name: "Scrambled Egg",
        imagePath: "assets/images/scrambled-egg.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "pasta",
        name: "Pasta",
        imagePath: "assets/images/pasta.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "lettuce",
        name: "Lettuce",
        imagePath: "assets/images/lettuce.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "cantaloupe",
        name: "Cantaloupe",
        imagePath: "assets/images/cantaloupe.png",
        calories: 1,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
  ];

  // custom meal planner
  List<Food> _planner = [];

  // getter methods

  List<Food> get foodList => _foodList;
  List<Food> get planner => _planner;

  // add to meal planner
  void addToMealPlanner(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _planner.add(foodItem);
    }
    notifyListeners();
  }

  // remove from meal planner
  void removeFromMealPlanner(Food food) {
    _planner.remove(food);
    notifyListeners();
  }
}
