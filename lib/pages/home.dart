import 'package:defat/pages/food_detection/fd_front.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        Center(
          child: Text(
            'meals page',
          ),
        ),
        FoodML(),
        Center(
          child: Text(
            'dictionary page',
          ),
        ),
      ][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        elevation: 0.0,
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: Image.asset("assets/icons/meals.png", width: 30, height: 30),
            label: "Meals",
          ),
          NavigationDestination(
            icon: Image.asset('assets/icons/home_camera.png',
                width: 30, height: 30),
            label: 'Camera',
          ),
          NavigationDestination(
            icon: Image.asset('assets/icons/dictionary.png',
                width: 30, height: 30),
            label: 'Dictionary',
          ),
        ],
      ),
    );
  }
}
