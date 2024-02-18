import 'package:flutter/material.dart';
import 'package:nufit/components/tip_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome to ",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w100),
                      ),
                      const Text(
                        "Nu",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      const Text(
                        "Fit",
                        style: TextStyle(fontSize: 28, color: Colors.grey),
                      ),
                      // Profile Icon
                      const SizedBox(
                        width: 80,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 38,
                          width: 38,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons//user.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 118),
                    child: Text(
                      "Here are golden tips for your meal",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TipCard(
                    imgPath: "assets/images/vegetable.png",
                    firstFirst: "Greenish",
                    firstFirstColor: Colors.green.shade300,
                    secondFirst: " your dish",
                    secondFirstColor: Colors.grey,
                    bottomLine: "Eat more vegetable",
                    bottomColor: Colors.green[500],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
