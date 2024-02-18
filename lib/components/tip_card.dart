import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {
  final String imgPath;
  final String firstFirst;
  final firstFirstColor;
  final secondFirstColor;
  final String secondFirst;
  final bottomColor;
  final String bottomLine;

  const TipCard({
    super.key,
    required this.imgPath,
    required this.firstFirst,
    required this.firstFirstColor,
    required this.secondFirst,
    required this.secondFirstColor,
    required this.bottomLine,
    required this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.yellow.shade700),
          right: BorderSide(width: 1.0, color: Colors.yellow.shade700),
          left: BorderSide(width: 1.0, color: Colors.yellow.shade700),
          bottom: BorderSide(width: 1.0, color: Colors.yellow.shade700),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                firstFirst,
                style: TextStyle(
                    color: firstFirstColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              Text(
                secondFirst,
                style: TextStyle(color: secondFirstColor, fontSize: 28),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            imgPath,
            width: 85,
            height: 85,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            bottomLine,
            style: TextStyle(
                color: bottomColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
