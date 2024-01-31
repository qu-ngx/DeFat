import 'dart:io';
import 'package:defat/models/food.dart';
import 'package:defat/models/planner.dart';
import 'package:defat/pages/food_detection/fd_back.dart';
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
  Widget replaceWidget(
      String name, int calories, int fat, int fibers, int carbs, int proteins) {
    return Container(
      color: Colors.amber,
      height: 120,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              "Food name: $name\n Cal: $calories\n Fat: $fat\n Fib: $fibers\n Carb: $carbs\n Prot: $proteins"),
          IconButton(
            onPressed: () {
              setState(() {
                // 0 is the index of the widget you want to replace
                // 1 iindex 1 because you just want to replace that one widget
                widgetList.replaceRange(0, 1,
                    [initWidget(name, calories, fat, fibers, carbs, proteins)]);
              });
            },
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
          )
        ],
      ),
    );
  }

  // The default food name widget
  Widget initWidget(
      String name, int calories, int fat, int fibers, int carbs, int proteins) {
    return Container(
      color: Colors.amber,
      height: 40,
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(25)),
          const Text(
            "View food details",
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                // 0 is the index of the widget you want to replace
                // 1 is 0 + 1 because you just want to replace that one widget
                widgetList.replaceRange(0, 1, [
                  replaceWidget(name, calories, fat, fibers, carbs, proteins)
                ]);
              });
            },
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
          )
        ],
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
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: (image != null) ? Image.memory(image!) : Container(),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (Platform.isAndroid || Platform.isIOS)
                      IconButton(
                        onPressed: () async {
                          final result = await imagePicker.pickImage(
                            source: ImageSource.camera,
                          );
                          if (result != null) {
                            image = foodDetection!.analyseImage(result.path);
                            setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.camera,
                          size: 64,
                        ),
                      ),
                    IconButton(
                      onPressed: () async {
                        final result = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (result != null) {
                          image = foodDetection!.analyseImage(result.path);

                          String? label;
                          label = foodDetection!.getPredLabel(result.path);

                          Food foodItem = planner.showTheFood(label);

                          String name = foodItem.name;

                          int calories = foodItem.calories;

                          int carbs = foodItem.carbs;

                          int fibers = foodItem.fibers;

                          int fat = foodItem.fat;

                          int proteins = foodItem.proteins;

                          widgetList.add(initWidget(
                              name, calories, carbs, fibers, fat, proteins));

                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.photo,
                        size: 64,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widgetList,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
