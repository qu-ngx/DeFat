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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 800,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Quizz",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 500,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Colors.orange.shade500),
                          top: BorderSide(
                              width: 1.0, color: Colors.orange.shade500),
                          left: BorderSide(
                              width: 1.0, color: Colors.orange.shade500),
                          right: BorderSide(
                              width: 1.0, color: Colors.orange.shade500),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/dict_1.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: const ExpansionTile(
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
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: const ExpansionTile(
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
                            fit: BoxFit.fill),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: const ExpansionTile(
                        title: Text(
                          "Hard - Meals For Personal Goals",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Text(
                            "Coming Soon!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
