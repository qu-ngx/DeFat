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
      body: ListView(children: [
        Consumer<Planner>(
            builder: (context, value, child) => Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: Text(
                        "Overview",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 75),
                      child: Text(
                        "See what you added to your meal here.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Center(
                        child: CircularPercentIndicator(
                      radius: 120,
                      lineWidth: 26,
                      percent: value.totalCaloriesCount().toInt() / 2500,
                      progressColor: Colors.orange,
                      backgroundColor: Colors.orange.shade100,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "Calories:\n${value.totalCaloriesCount()} / 2500",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.yellow.shade900),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          percent:
                              (value.totalProteinsCount() / 100).toDouble(),
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.red,
                          backgroundColor: Colors.red.shade100,
                        ),
                        CircularPercentIndicator(
                          percent:
                              (value.totalProteinsCount() / 100).toDouble(),
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.brown,
                          backgroundColor: Colors.brown.shade100,
                        ),
                        CircularPercentIndicator(
                          percent:
                              (value.totalProteinsCount() / 100).toDouble(),
                          radius: 20,
                          lineWidth: 8,
                          progressColor: Colors.green,
                          backgroundColor: Colors.green.shade100,
                        ),
                        CircularPercentIndicator(
                          percent:
                              (value.totalProteinsCount() / 100).toDouble(),
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
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "Recommend",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "< 65g ",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "300g",
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ">30g",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50g",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            'View full details of nutritions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  CircularPercentIndicator(
                                    percent: (value.totalFatCount() / 200)
                                        .toDouble(),
                                    radius: 70,
                                    lineWidth: 17,
                                    progressColor: Colors.red,
                                    backgroundColor: Colors.red.shade100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Text(
                                      "   Fat \n ${value.totalFatCount()} / 200",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  CircularPercentIndicator(
                                    percent: (value.totalCarbsCount() / 200)
                                        .toDouble(),
                                    radius: 70,
                                    lineWidth: 17,
                                    progressColor: Colors.brown,
                                    backgroundColor: Colors.brown.shade100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Text(
                                      " Carbs \n ${value.totalCarbsCount()} / 200",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  CircularPercentIndicator(
                                    percent: (value.totalFibersCount() / 200)
                                        .toDouble(),
                                    radius: 70,
                                    lineWidth: 17,
                                    progressColor: Colors.green,
                                    backgroundColor: Colors.green.shade100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Text(
                                      "Fibers \n ${value.totalFibersCount()} / 200",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  CircularPercentIndicator(
                                    percent:
                                        value.totalProteinsCount().toDouble() /
                                            200,
                                    radius: 70,
                                    lineWidth: 17,
                                    progressColor: Colors.blue,
                                    backgroundColor: Colors.blue.shade100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: Text(
                                      "Proteins\n  ${value.totalFatCount()} / 200",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
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
