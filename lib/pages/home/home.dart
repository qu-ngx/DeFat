import 'package:flutter/material.dart';
import 'package:nufit/components/tip_card.dart';
import 'package:nufit/pages/food_detection/fd_front.dart';
import 'package:nufit/pages/profile/profile_page.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 800,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/user.png',
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210),
                    child: Text(
                      "Golden tips ",
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      "Build healthier meals with these tips",
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TipCard(
                            imgPath: "assets/images/vegetable.png",
                            firstFirst: "Greenish",
                            firstFirstColor: Colors.green.shade300,
                            secondFirst: " your dish",
                            secondFirstColor: Colors.grey,
                            bottomLine: "To gain more fibers",
                            bottomColor: Colors.green[500],
                          ),
                          TipCard(
                            imgPath: "assets/images/poultry_fish.png",
                            firstFirst: "Eat more",
                            firstFirstColor: Colors.green.shade300,
                            secondFirst: " poultry & fish",
                            secondFirstColor: Colors.grey,
                            bottomLine: "To gain good proteins, omega\n",
                            bottomColor: Colors.green[500],
                          ),
                          TipCard(
                            imgPath: "assets/images/meat.png",
                            firstFirst: "Reduce",
                            firstFirstColor: Colors.red.shade300,
                            secondFirst: " red meat",
                            secondFirstColor: Colors.red.shade800,
                            bottomLine:
                                "To reduce cholesterol, strokes\n and heart attacks",
                            bottomColor: Colors.green[500],
                          ),
                          TipCard(
                            imgPath: "assets/images/fast-food.png",
                            firstFirst: "Say no",
                            firstFirstColor: Colors.red.shade300,
                            secondFirst: " to fast food",
                            secondFirstColor: Colors.yellow.shade700,
                            bottomLine: "To reduce fat in blood\n",
                            bottomColor: Colors.green[500],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text(
                      "AI Camera ",
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      "Use AI Camera to see nutritions in your food",
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FoodML(
                                boolLeading: true,
                              )));
                    },
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade700,
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(
                              width: 1.0, color: Colors.yellow.shade700),
                          right: BorderSide(
                              width: 1.0, color: Colors.yellow.shade700),
                          left: BorderSide(
                              width: 1.0, color: Colors.yellow.shade700),
                          bottom: BorderSide(
                              width: 1.0, color: Colors.yellow.shade700),
                        ),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 45,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Detect food with AI Camera",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
