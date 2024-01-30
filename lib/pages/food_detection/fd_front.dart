import 'dart:io';
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
  String? label;

  @override
  void initState() {
    super.initState();
    foodDetection = FoodDetection();
  }

  @override
  Widget build(BuildContext context) {
    final planner = context.read<Planner>();
    final foodList = planner.foodList;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: (image != null) ? Image.memory(image!) : Container(),
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

                        // Get label and return a small column leading to Dictionary or adding to meal planner
                        label = foodDetection!.getPredLabel(result.path);
                        int foodIndex;
                        for (int i = 0; i < foodList.length; i++) {
                          if (label == foodList[i].label) {
                            foodIndex = i;
                          }
                        }
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
    ));
  }
}