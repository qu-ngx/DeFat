import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Ready to brush up your knowledge on food?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // First box for the first question
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        width: 355,
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                        ),
                        child: const Column(children: [
                          Text(
                            "First set of questions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.transparent),
                          )
                        ]),
                      ),
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
