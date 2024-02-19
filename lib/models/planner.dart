import 'package:flutter/material.dart';
import 'food.dart';

class Planner extends ChangeNotifier {
  final List<Food> _foodList = [
    Food(
        label: "french_fries",
        name: "French Fries",
        imagePath: "assets/images/french-fries.png",
        calories: 100,
        fat: 17,
        proteins: 4,
        carbs: 48,
        fibers: 0),
    Food(
        label: "sausage",
        name: "Sausage",
        imagePath: "assets/images/sausage.png",
        calories: 341,
        fat: 20,
        proteins: 14,
        carbs: 2.6,
        fibers: 0),
    Food(
        label: "grilled_chicken",
        name: "Grilled Chicken",
        imagePath: "assets/images/grilled-chicken.png",
        calories: 284,
        fat: 6.5,
        proteins: 57,
        carbs: 0,
        fibers: 0),
    Food(
        label: "fish",
        name: "Fish",
        imagePath: "assets/images/fish.png",
        calories: 56,
        fat: 0.8,
        proteins: 12.3,
        carbs: 0,
        fibers: 0),
    Food(
        label: "scrambled_egg",
        name: "Scrambled Egg",
        imagePath: "assets/images/scrambled-egg.png",
        calories: 91,
        fat: 6.7,
        proteins: 6.1,
        carbs: 1,
        fibers: 0.7),
    Food(
        label: "pasta",
        name: "Pasta",
        imagePath: "assets/images/pasta.png",
        calories: 196,
        fat: 1.2,
        proteins: 7.2,
        carbs: 13.4,
        fibers: 1.8),
    Food(
        label: "lettuce",
        name: "Lettuce",
        imagePath: "assets/images/lettuce.png",
        calories: 16,
        fat: 0.3,
        proteins: 1.2,
        carbs: 6.2,
        fibers: 3.6),
    Food(
        label: "cantaloupe",
        name: "Cantaloupe",
        imagePath: "assets/images/cantaloupe.png",
        calories: 94,
        fat: 0.5,
        proteins: 4.6,
        carbs: 8.7,
        fibers: 0.8),
  ];

  // custom meal planner
  // ignore: prefer_final_fields
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

  double totalCaloriesCount() {
    double totalCalories = 0;
    for (int i = 0; i < _planner.length; i++) {
      totalCalories += _planner[i].calories;
    }
    return totalCalories;
  }

  double totalFatCount() {
    double totalFat = 0;
    for (int i = 0; i < _planner.length; i++) {
      totalFat += _planner[i].fat;
    }
    return totalFat;
  }

  double totalProteinsCount() {
    double totalProteins = 0;
    for (int i = 0; i < _planner.length; i++) {
      totalProteins += _planner[i].proteins;
    }
    return totalProteins;
  }

  double totalCarbsCount() {
    double totalCarbs = 0;
    for (int i = 0; i < _planner.length; i++) {
      totalCarbs += _planner[i].carbs;
    }
    return totalCarbs;
  }

  double totalFibersCount() {
    double totalFibers = 0;
    for (int i = 0; i < _planner.length; i++) {
      totalFibers += _planner[i].fibers;
    }
    return totalFibers;
  }

  int? getFoodIndex(String? label) {
    for (int i = 0; i < _foodList.length; i++) {
      if (label == _foodList[i].label) {
        return i;
      }
    }
    return null;
  }

  // Show the Food in AI camera
  showTheFood(String? label) {
    for (int i = 0; i < _foodList.length; i++) {
      if (label == _foodList[i].label) {
        return _foodList[i];
      }
    }
  }
}
