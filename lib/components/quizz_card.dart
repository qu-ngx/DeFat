import 'package:flutter/material.dart';
import 'package:nufit/models/question.dart';

class QuizCard extends StatefulWidget {
  final String category;
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final colors;
  const QuizCard(
      {super.key,
      required this.category,
      required this.title,
      required this.colors});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Question(category: widget.category)));
      },
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5.0,
        child: Container(
          width: 355,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[100],
          ),
          child: Column(children: [
            Text(
              widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: widget.colors,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  backgroundColor: Colors.transparent),
            )
          ]),
        ),
      ),
    );
  }
}
