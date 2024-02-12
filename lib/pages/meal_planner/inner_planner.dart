import 'package:nufit/models/food.dart';
import 'package:nufit/models/planner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InnerMealPlanner extends StatelessWidget {
  const InnerMealPlanner({super.key});

  // remove from Meal Planner
  void removeFromMealPlanner(Food food, BuildContext context) {
    // get access to meal planner
    final planner = context.read<Planner>();

    // remove from meal planner
    planner.removeFromMealPlanner(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Planner>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: const Text(
            "See what is in your meal!",
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: value.planner.length,
          itemBuilder: (context, index) {
            // get food from meal planner
            final Food food = value.planner[index];

            // get food name
            final String foodName = food.name;

            // get food calories
            final String foodCalories = food.calories.toString();

            // get food carbs
            final String foodCarbs = food.carbs.toString();

            // get food fat
            final String foodFat = food.fat.toString();

            // get food fibers
            final String foodFibers = food.fibers.toString();

            // get food proteins
            final String foodProteins = food.proteins.toString();

            // return list title of food
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListTile(
                title: Text(
                  foodName,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Calories: $foodCalories\nCarbs: $foodCarbs\nFat: $foodFat\nFibers: $foodFibers\nProteins: $foodProteins",
                ),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.highlight_remove_sharp,
                      size: 40,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      removeFromMealPlanner(food, context);
                      // THIS MUST BE IMPORTANT ONE
                    }),
              ),
            );
          },
        ),
      ),
    );
  }
}
