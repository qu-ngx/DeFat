import 'package:defat/components/button.dart';
import 'package:defat/models/food.dart';
import 'package:flutter/material.dart';

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
      quantityCount--;
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to Meal Planner
  void addToMealPlanner() {}

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

                  // Calories
                  Row(
                    children: [
                      // logo for calories if has (Later change to circle or percent widget)
                      const SizedBox(width: 25),
                      Icon(
                        Icons.food_bank,
                        color: Colors.yellow[800],
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
                      )
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
                    "Something please do description later or import from the food file",
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
            color: Colors.yellow[700],
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // calories + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.food.calories} calories \n per 100 grams",
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
                          decoration: BoxDecoration(
                              color: Colors.yellow[500],
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              (quantityCount * widget.food.calories).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow[500],
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
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
