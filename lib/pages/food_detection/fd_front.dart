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

  Widget foodInfoDropDown(
      String name, int calories, int fat, int fibers, int carbs, int proteins) {
    return Container(
      color: Colors.transparent,
      height: 125,
      width: 370,
      child: Column(children: [
        Expanded(
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
            ],
          ),
        )
      ]),
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
        appBar: AppBar(),
        body: SafeArea(
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
                                image =
                                    foodDetection!.analyseImage(result.path);
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

                              Food foodItem = planner.showTheFood(label!);

                              String name = foodItem.name;

                              int calories = foodItem.calories;

                              int carbs = foodItem.carbs;

                              int fibers = foodItem.fibers;

                              int fat = foodItem.fat;

                              int proteins = foodItem.proteins;

                              widgetList.add(foodInfoDropDown(name, calories,
                                  fat, fibers, carbs, proteins));
                            }
                            setState(() {});
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
