import 'package:nufit/components/food_tile.dart';
import 'package:nufit/models/planner.dart';
import 'package:nufit/pages/dictionary/food_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictPage extends StatefulWidget {
  const DictPage({super.key});

  @override
  State<DictPage> createState() => _DictPageState();
}

class _DictPageState extends State<DictPage> {
  // Navigate to each food details page
  void navigateToFoodDetails(int index) {
    // Access the models of food
    final planner = context.read<Planner>();
    final foodList = planner.foodList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodList[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the planner and it's menu (food)
    final planner = context.read<Planner>();
    final foodList = planner.foodList;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Foodpedia",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),

                const SizedBox(
                  height: 10,
                ),
                // search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.find_in_page,
                      ),
                      filled: true,
                      hintText: "Search for food",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
          // Common food list
          // Padding(
          //   padding: const EdgeInsets.only(top: 25.0, bottom: 25),
          //   child: Text(
          //     "Most Common Food",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.grey[800],
          //       fontSize: 18,
          //     ),
          //   ),
          // ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodList.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodList[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
