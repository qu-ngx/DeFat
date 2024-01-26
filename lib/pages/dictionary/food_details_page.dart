import 'package:defat/models/food.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
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
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
