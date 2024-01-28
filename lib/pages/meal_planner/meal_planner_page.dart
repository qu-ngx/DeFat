import 'package:defat/components/button.dart';
import 'package:defat/pages/meal_planner/inner_planner.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({super.key});

  @override
  State<MealPlannerPage> createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  void navigateToInnerPlanner(BuildContext context) {
    // Access the models of food
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InnerMealPlanner()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Meals"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CircularPercentIndicator(
            radius: 150,
            lineWidth: 30,
            percent: 0.4,
            progressColor: Colors.green,
            backgroundColor: Colors.green.shade100,
            circularStrokeCap: CircularStrokeCap.round,
          )),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                MyButton(
                  text: "Inspect your meal planner",
                  onTap: () {
                    navigateToInnerPlanner(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
