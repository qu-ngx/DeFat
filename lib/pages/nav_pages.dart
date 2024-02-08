import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nufit/pages/dictionary/dictionary_page.dart';
import 'package:nufit/pages/food_detection/fd_front.dart';
import 'package:nufit/pages/meal_planner/meal_planner_page.dart';
import 'package:nufit/pages/profile/profile_page.dart';
import 'package:nufit/pages/quizz/quizz_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomNavigationKey,
      body: const [
        MealPlannerPage(),
        FoodML(),
        DictPage(),
        QuizzPage(),
        ProfilePage(),
      ][_page],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.orange,
          animationDuration: const Duration(milliseconds: 300),
          buttonBackgroundColor: Colors.orange.shade100,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(
              Icons.dinner_dining_sharp,
              size: 30,
              color: Colors.grey.shade600,
            ),
            Image.asset(
              'assets/icons/home_camera.png',
              width: 30,
              height: 30,
              color: Colors.grey.shade600,
            ),
            Image.asset(
              'assets/icons/dictionary.png',
              width: 33,
              height: 33,
              color: Colors.grey.shade600,
            ),
            Icon(
              Icons.quiz_outlined,
              size: 30,
              color: Colors.grey.shade600,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.grey.shade600,
            ),
          ]),

      // body: const [
      //   MealPlannerPage(),
      //   FoodML(),
      //   DictPage(),
      //   ProfilePage()
      // ][selectedPageIndex],
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: selectedPageIndex,
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       selectedPageIndex = index;
      //     });
      //   },
      //   elevation: 0.0,
      //   destinations: <NavigationDestination>[
      //     NavigationDestination(
      //       icon: Icon(
      //         Icons.dinner_dining_sharp,
      //         size: 34,
      //       ),
      //       label: "Meals",
      //     ),
      //     NavigationDestination(
      //       icon: Image.asset('assets/icons/home_camera.png',
      //           width: 30, height: 30),
      //       label: 'Camera',
      //     ),
      //     NavigationDestination(
      //       icon: Image.asset('assets/icons/dictionary.png',
      //           width: 30, height: 30),
      //       label: 'Dictionary',
      //     ),
      //     const NavigationDestination(
      //         icon: Icon(Icons.person), label: 'Profile')
      //   ],
      // ),
    );
  }
}
