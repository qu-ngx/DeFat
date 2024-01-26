import 'package:defat/components/food_tile.dart';
import 'package:defat/models/food.dart';
import 'package:defat/pages/dictionary/food_details_page.dart';
import 'package:flutter/material.dart';

class DictPage extends StatefulWidget {
  const DictPage({super.key});

  @override
  State<DictPage> createState() => _DictPageState();
}

class _DictPageState extends State<DictPage> {
  List foodList = [
    Food(
        label: "french_fries",
        name: "French Fries",
        imagePath: "assets/images/french-fries.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "sausage",
        name: "Sausage",
        imagePath: "assets/images/sausage.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "grilled_chicken",
        name: "Grilled Chicken",
        imagePath: "assets/images/grilled-chicken.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "fish",
        name: "Fish",
        imagePath: "assets/images/fish.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "scrambled_egg",
        name: "Scrambled Egg",
        imagePath: "assets/images/scrambled-egg.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "pasta",
        name: "Pasta",
        imagePath: "assets/images/pasta.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "lettuce",
        name: "Lettuce",
        imagePath: "assets/images/lettuce.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
    Food(
        label: "cantaloupe",
        name: "Cantaloupe",
        imagePath: "assets/images/cantaloupe.png",
        calories: 0,
        fat: 0,
        proteins: 0,
        carbs: 0,
        fibers: 0),
  ];

  // navigate to each food details page
  void navigateToFoodDetails(int index) {
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu_book_rounded,
          color: Colors.grey[900],
        ),
        title: Text(
          "Food Dictionary",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
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

          const SizedBox(height: 25),

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
              padding: const EdgeInsets.only(left: 50, right: 50),
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
