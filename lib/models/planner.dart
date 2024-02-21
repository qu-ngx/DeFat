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
        fibers: 0,
        details:
            "French fries are typically made from potatoes, oil for frying, and salt for seasoning. To make French fries, potatoes are peeled and cut into thin strips, usually about a quarter to a half-inch thick. The potatoes are then rinsed to remove excess starch and dried thoroughly. They are then fried in oil at a high temperature until they become golden brown and crispy. Traditionally, they are fried twice: once at a lower temperature to cook the inside of the fries, and then at a higher temperature to achieve crispiness."),
    Food(
        label: "sausage",
        name: "Sausage",
        imagePath: "assets/images/sausage.png",
        calories: 341,
        fat: 20,
        proteins: 14,
        carbs: 2.6,
        fibers: 0,
        details:
            "Sausage typically contains a significant amount of protein, often high in fat, or particularly saturated fat. Due to their high fat, calorie, and sodium content, sausages are often considered to be indulgent or occasional treats rather than everyday dietary staples."),
    Food(
        label: "grilled_chicken",
        name: "Grilled Chicken",
        imagePath: "assets/images/grilled-chicken.png",
        calories: 284,
        fat: 6.5,
        proteins: 57,
        carbs: 0,
        fibers: 0,
        details:
            "Grilled chicken is an excellent source of high-quality protein, which is essential for building and repairing tissues, including muscles, bones, skin, and organs. A 3-ounce (85 grams) serving of grilled chicken breast typically provides about 25 grams of protein. Grilled chicken is relatively low in calories and naturally low in fat, particularly saturated fat."),
    Food(
        label: "fish",
        name: "Fish",
        imagePath: "assets/images/fish.png",
        calories: 56,
        fat: 0.8,
        proteins: 12.3,
        carbs: 0,
        fibers: 0,
        details:
            "Fish is an excellent source of high-quality protein, vitamins, and minerals. It is rich in omega-3 fatty acids, which are beneficial for heart health and brain function. Fish is also low in saturated fat and cholesterol, making it a healthy choice for many diets."),
    Food(
        label: "scrambled_egg",
        name: "Scrambled Egg",
        imagePath: "assets/images/scrambled-egg.png",
        calories: 91,
        fat: 6.7,
        proteins: 6.1,
        carbs: 1,
        fibers: 0.7,
        details:
            "The primary ingredient for scrambled eggs is eggs, though they can be enhanced with various ingredients such as milk, cream, butter, salt, and pepper. To make scrambled eggs, crack the desired number of eggs into a bowl and whisk them until the yolks and whites are well combined."),
    Food(
        label: "pasta",
        name: "Pasta",
        imagePath: "assets/images/pasta.png",
        calories: 196,
        fat: 1.2,
        proteins: 7.2,
        carbs: 13.4,
        fibers: 1.8,
        details:
            "Pasta is a good source of complex carbohydrates, which provide sustained energy. It is low in fat and cholesterol-free, making it a healthy option when paired with nutrient-rich sauces and ingredients. Whole wheat pasta offers additional fiber and nutrients compared to refined pasta."),
    Food(
        label: "lettuce",
        name: "Lettuce",
        imagePath: "assets/images/lettuce.png",
        calories: 16,
        fat: 0.3,
        proteins: 1.2,
        carbs: 6.2,
        fibers: 3.6,
        details:
            "Lettuce is low in calories and rich in vitamins and minerals, making it a healthy addition to salads and sandwiches. It is a good source of vitamin A, vitamin K, folate, and antioxidants."),
    Food(
        label: "cantaloupe",
        name: "Cantaloupe",
        imagePath: "assets/images/cantaloupe.png",
        calories: 94,
        fat: 0.5,
        proteins: 4.6,
        carbs: 8.7,
        fibers: 0.8,
        details:
            "Cantaloupe is a nutritious fruit that is low in calories and fat but high in essential vitamins and minerals. It is an excellent source of vitamin C, vitamin A (in the form of beta-carotene), potassium, and dietary fiber. These nutrients contribute to overall health and may help support immune function, eye health, and digestion."),
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
