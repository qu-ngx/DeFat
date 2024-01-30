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

  // This widgetList is a children for line 143
  List<Widget> widgetList = [];


  // Replace the according food name widget with a more detailed information one
  Widget replaceWidget() {
     return Container(
      color: Colors.amber,
      height: 120,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text("Food header with info"),
          IconButton(onPressed: () {
            setState(() {
              // 0 is the index of the widget you want to replace
              // 1 is 0 + 1 because you just want to replace that one widget
              widgetList.replaceRange(0, 1, [initWidget()]);
            });
          },
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
          )
        ],
      ),
    ); 
  }

  // The default food name widget
  Widget initWidget() {
    return Container(
      color: Colors.amber,
      height: 40,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text("Food header"),
          IconButton(onPressed: () {
            setState(() {
              // 0 is the index of the widget you want to replace
              // 1 is 0 + 1 because you just want to replace that one widget
              widgetList.replaceRange(0, 1, [replaceWidget()]);
            });
          },
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
          )
        ],
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    foodDetection = FoodDetection();
    widgetList.add(initWidget());
  }

  @override
  Widget build(BuildContext context) {
    final planner = context.read<Planner>();
    final foodList = planner.foodList;
    return Scaffold(
<<<<<<< HEAD
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
=======
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
>>>>>>> e3ffa4316640f80f973959cd7f78420dd4738e5b
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
