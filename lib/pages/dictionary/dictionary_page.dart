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
          Container(
            color: Colors.orange,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Foodpedia",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Padding(
                  padding: EdgeInsets.only(right: 230),
                  child: Text(
                    "Search for food: ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                // search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.find_in_page,
                      ),
                      filled: true,
                      hintText: "Name of food",
                      hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ), // Common food list
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
