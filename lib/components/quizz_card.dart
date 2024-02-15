import 'package:flutter/material.dart';
import 'package:nufit/models/question.dart';

class QuizCard extends StatefulWidget {
  final String category;
  final String title;
  // ignore: prefer_typing_uninitialized_variables

  const QuizCard({
    super.key,
    required this.category,
    required this.title,
  });

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
          width: 340,
          height: 85,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange.shade200,
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                widget.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    backgroundColor: Colors.transparent),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
