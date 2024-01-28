import 'package:defat/components/button.dart';
import 'package:defat/models/planner.dart';
import 'package:defat/pages/meal_planner/inner_planner.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({
    super.key,
  });

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

  Future caloriesCountPercentGet() async {
    final planner = context.read<Planner>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Planner>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                title: const Text("Meals"),
                backgroundColor: Colors.transparent,
              ),
              body: Consumer<Planner>(
                  builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: CircularPercentIndicator(
                            radius: 150,
                            lineWidth: 30,
                            percent: value.totalCaloriesCount() / 2500,
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
                      )),
            ));
  }
}
