import 'package:nufit/components/button.dart';
import 'package:nufit/models/food.dart';
import 'package:nufit/models/planner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity here is gram (quantityCount * 100)
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to Meal Planner
  void addToMealPlanner() {
    // only add to meal planner when there is actually a thing in a meal planner
    if (quantityCount > 0) {
      // get access to the meal planener
      final planner = context.read<Planner>();

      // add to the meal planner
      planner.addToMealPlanner(widget.food, quantityCount);

      // let user know it was successful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            "Successfully added to your meal planner",
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            IconButton(
                onPressed: () {
                  // Pop once to remove dialog box
                  Navigator.pop(context);

                  // Pop again to go previous screen
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.black,
                )),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Kcal",
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Fat",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Carbs",
                        style: TextStyle(color: Colors.brown),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Fibers",
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Prot",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  // Calories
                  Row(
                    children: [
                      // logo for calories if has (Later change to circle or percent widget)
                      Icon(
                        Icons.circle,
                        color: Colors.orange.shade200,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // number of calories
                      Text(
                        widget.food.calories.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      Icon(
                        Icons.circle,
                        color: Colors.red.shade200,
                      ),

                      // number of calories
                      Text(
                        widget.food.fat.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Icon(
                        Icons.circle,
                        color: Colors.brown.shade200,
                      ),

                      // number of calories
                      Text(
                        widget.food.carbs.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Icon(
                        Icons.circle,
                        color: Colors.green.shade200,
                      ),

                      // number of calories
                      Text(
                        widget.food.fibers.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Icon(
                        Icons.circle,
                        color: Colors.blue.shade200,
                      ),

                      // number of calories
                      Text(
                        widget.food.proteins.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.food.name,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),

                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.food.details,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bar to add the following food to the meal planner
          Container(
            color: Colors.orange.shade600,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // calories + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.food.calories} calories \n per serving",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    // quantity
                    Row(
                      children: [
                        // substract quantity from tempo meal planner
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        SizedBox(
                          width: 55,
                          child: Center(
                            child: Text(
                              (quantityCount * widget.food.calories).toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),
                // add total quantity to meal planner button

                MyButton(text: "Add to Meal Planner", onTap: addToMealPlanner)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
