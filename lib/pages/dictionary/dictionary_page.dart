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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text(
      //     "Food Search",
      //     style:
      //         TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Column(
        children: [
          const SizedBox(height: 50),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

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
              padding: const EdgeInsets.only(left: 30, right: 30),
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
