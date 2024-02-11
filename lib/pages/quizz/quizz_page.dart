import 'package:flutter/material.dart';
import 'package:nufit/components/quizz_card.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Quizz",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Ready to brush up your knowledge on food?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // First box for the first question
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        QuizCard(
                            category: "Fat",
                            title: "Lesson 1: Fat",
                            colors: Colors.green),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                            category: "Carbs",
                            title: "Lesson 2: Carbs",
                            colors: Colors.green),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                            category: "Fibers",
                            title: "Lesson 3: Fibers",
                            colors: Colors.green),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                            category: "Proteins",
                            title: "Lesson 4: Fibers",
                            colors: Colors.green),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
