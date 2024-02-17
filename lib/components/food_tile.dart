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
              padding: const EdgeInsets.only(right: 30),
              width: 650,
              height: 85,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.orange.shade500),
                  right: BorderSide(width: 1.0, color: Colors.orange.shade500),
                  left: BorderSide(width: 1.0, color: Colors.orange.shade500),
                  bottom: BorderSide(width: 1.0, color: Colors.orange.shade500),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 6), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      food.name,
                      style: TextStyle(
                          color: Colors.orange.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Image.asset(
                        food.imagePath,
                        height: 40,
                      ),
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
