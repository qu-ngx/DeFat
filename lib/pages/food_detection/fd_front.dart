import 'dart:io';
import 'package:nufit/components/button.dart';
import 'package:nufit/models/food.dart';
import 'package:nufit/models/planner.dart';
import 'package:nufit/pages/dictionary/food_details_page.dart';
import 'package:nufit/pages/food_detection/fd_back.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FoodML extends StatefulWidget {
  const FoodML({super.key});

  @override
  State<FoodML> createState() => _FoodMLState();
}

class _FoodMLState extends State<FoodML> {
  final imagePicker = ImagePicker();

  FoodDetection? foodDetection;

  Uint8List? image;

  // This widgetList is a children for line 143
  List<Widget> widgetList = [];

  // Replace the according food name widget with a more detailed information one

  void navigateToFoodDetails(String? label) {
    // Access the models of food
    final planner = context.read<Planner>();
    final foodList = planner.foodList;
    int? index = planner.getFoodIndex(label);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodList[index!],
        ),
      ),
    );
  }

  Widget foodInfoDropDown(String label, String name, int calories, int fat,
      int fibers, int carbs, int proteins) {
    return Expanded(
      child: Container(
        height: 623,
        color: Colors.transparent,
        child: Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                'Food detected: $name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                    iconColor: Colors.grey,
                    title: Text(
                      "Cal: $calories Fat: $fat Fib: $fibers Carb: $carbs Prot: $proteins",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 280,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 55, right: 55, bottom: 22),
                  child: Column(
                    children: [
                      MyButton(
                          text: "Check in Foodpedia",
                          onTap: () {
                            navigateToFoodDetails(label);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    foodDetection = FoodDetection();
  }

  @override
  Widget build(BuildContext context) {
    final planner = context.read<Planner>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "AI Food Camera",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child:
                          (image != null) ? Image.memory(image!) : Container(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (Platform.isAndroid || Platform.isIOS)
                        Container(
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange.shade300,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              final result = await imagePicker.pickImage(
                                source: ImageSource.camera,
                              );
                              if (result != null) {
                                image =
                                    foodDetection!.analyseImage(result.path);

                                String? label;
                                label =
                                    foodDetection!.getPredLabel(result.path);

                                // Null handler for label
                                if (label != null) {
                                  Food foodItem = planner.showTheFood(label);

                                  String name = foodItem.name;

                                  int calories = foodItem.calories;

                                  int carbs = foodItem.carbs;

                                  int fibers = foodItem.fibers;

                                  int fat = foodItem.fat;

                                  int proteins = foodItem.proteins;

                                  // Removed the first widget list from the widgetlist if widgetlist is non-empty
                                  if (widgetList.isNotEmpty) {
                                    widgetList.removeAt(0);
                                  }
                                  foodInfoDropDown(label, name, calories, fat,
                                      fibers, carbs, proteins);
                                }
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.camera,
                              size: 64,
                              color: Colors.white,
                            ),
                            iconSize: 30,
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.shade300,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            final result = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (result != null) {
                              image = foodDetection!.analyseImage(result.path);

                              String? label;
                              label = foodDetection!.getPredLabel(result.path);

                              // Null handler for label
                              if (label != null) {
                                Food foodItem = planner.showTheFood(label);

                                String name = foodItem.name;

                                int calories = foodItem.calories;

                                int carbs = foodItem.carbs;

                                int fibers = foodItem.fibers;

                                int fat = foodItem.fat;

                                int proteins = foodItem.proteins;
                                if (widgetList.isNotEmpty) {
                                  widgetList.removeAt(0);
                                }
                                widgetList.add(foodInfoDropDown(label, name,
                                    calories, fat, fibers, carbs, proteins));
                              }
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.photo,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widgetList),
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
            ],
          ),
        ),
      ),
    );
  }
}
