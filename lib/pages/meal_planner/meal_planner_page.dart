import 'package:nufit/components/button.dart';
import 'package:nufit/models/planner.dart';
import 'package:nufit/pages/meal_planner/inner_planner.dart';
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
    // ignore: unused_local_variable
    final planner = context.read<Planner>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Meals",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        Consumer<Planner>(
            builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Center(
                        child: CircularPercentIndicator(
                      radius: 130,
                      lineWidth: 25,
                      percent: value.totalCaloriesCount() / 2500,
                      progressColor: Colors.yellow,
                      backgroundColor: Colors.yellow.shade100,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "${value.totalCaloriesCount()} / 2500 calories",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    )),
                    const SizedBox(height: 100),
                    // Button
                    Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          MyButton(
                            text: "Plan your meal ",
                            onTap: () {
                              navigateToInnerPlanner(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: ExpansionTile(
                        title: const Text(
                          'View all nutritions in your meals',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 17,
                            progressColor: Colors.orange,
                            backgroundColor: Colors.orange.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "   Fat \n ${value.totalFatCount()} / 50",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 70),
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 17,
                            progressColor: Colors.red,
                            backgroundColor: Colors.red.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              " Carbs \n ${value.totalCarbsCount()} / 50",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 70),
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 17,
                            progressColor: Colors.green,
                            backgroundColor: Colors.green.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "Fibers \n ${value.totalFibersCount()} / 50",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 70),
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 17,
                            progressColor: Colors.blue,
                            backgroundColor: Colors.blue.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "Proteins\n  ${value.totalFatCount()} / 50",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 70),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                )),
      ]),
    );
  }
}
