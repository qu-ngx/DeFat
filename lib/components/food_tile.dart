import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              width: 450,
              height: 300,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey.shade500),
                    right: BorderSide(width: 1.0, color: Colors.grey.shade500),
                    left: BorderSide(width: 1.0, color: Colors.grey.shade500)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 5, top: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      food.imagePath,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      food.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
