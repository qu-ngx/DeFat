import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttom Navigation Bar',
      home: Scaffold(
        body: const [
          Center(
            child: Text(
              'meals page',
            ),
          ),
          Center(
            child: Text(
              'camera page',
            ),
          ),
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
              icon: Image.asset("assets/meals.png", width: 30, height: 30),
              label: "Meals",
            ),
            NavigationDestination(
              icon:
                  Image.asset('assets/home_camera.png', width: 30, height: 30),
              label: 'Camera',
            ),
            NavigationDestination(
              icon: Image.asset('assets/dictionary.png', width: 30, height: 30),
              label: 'Dictionary',
            ),
          ],
        ),
      ),
    );
  }
}
