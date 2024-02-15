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
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 340,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/dict_1.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const ExpansionTile(
                      title: Text(
                        "Easy - Basic Nutritions",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        QuizCard(
                          category: "Fat",
                          title: "Lesson 1: Fat",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                          category: "Carbs",
                          title: "Lesson 2: Carbs",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                          category: "Fibers",
                          title: "Lesson 3: Fibers",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        QuizCard(
                          category: "Proteins",
                          title: "Lesson 4: Proteins",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 350,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/dict_2.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const ExpansionTile(
                      title: Text(
                        "Medium - Balance Meals",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Text(
                          "Coming Soon!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 340,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/dict_3.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const ExpansionTile(
                      title: Text(
                        "Hard - Meals For Personal Goals",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Text(
                          "Coming Soon!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
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
