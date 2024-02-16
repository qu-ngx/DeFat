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
        title: const Center(
          child: Text(
            "Meals",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: ListView(children: [
        Consumer<Planner>(
            builder: (context, value, child) => Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        "Meals",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: CircularPercentIndicator(
                      radius: 130,
                      lineWidth: 25,
                      percent: value.totalCaloriesCount() / 2500,
                      progressColor: Colors.orange,
                      backgroundColor: Colors.orange.shade100,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "Calories:\n${value.totalCaloriesCount()} / 2500",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.yellow.shade900),
                      ),
                    )),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.red,
                          backgroundColor: Colors.red.shade100,
                        ),
                        CircularPercentIndicator(
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.brown,
                          backgroundColor: Colors.brown.shade100,
                        ),
                        CircularPercentIndicator(
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.green,
                          backgroundColor: Colors.green.shade100,
                        ),
                        CircularPercentIndicator(
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.blue,
                          backgroundColor: Colors.blue.shade100,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "     Fat     ",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Carbs",
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "  Fibers",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Proteins",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: Colors.transparent,
                      child: ExpansionTile(
                        title: Text(
                          'View all nutritions in your meals',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        children: [
                          const SizedBox(height: 30),
                          CircularPercentIndicator(
                            radius: 90,
                            lineWidth: 17,
                            progressColor: Colors.red,
                            backgroundColor: Colors.red.shade100,
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
                            progressColor: Colors.brown,
                            backgroundColor: Colors.brown.shade100,
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
                  ],
                )),
      ]),
    );
  }
}
