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
  //// Second Nav Bar
  // int _page = 0;
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  PageController selectedPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
            tooltip: "AI Camera",
            shape: const CircleBorder(),
            onPressed: () {
              selectedPage.jumpToPage(2);
            },
            elevation: 1,
            backgroundColor: Colors.orange.shade200,
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 40,
              color: Colors.white,
            )),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        shape: const CircularNotchedRectangle(),
        elevation: 5.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            isSelected: true,
            iconSize: 34,
            onPressed: () {
              selectedPage.jumpToPage(0);
            },
            icon: Image.asset(
              'assets/icons/meals.png',
              color: Colors.white,
            ),
          ),
          IconButton(
            isSelected: true,
            iconSize: 20,
            onPressed: () {
              selectedPage.jumpToPage(1);
            },
            icon: Image.asset(
              'assets/icons/book.png',
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          IconButton(
            isSelected: true,
            iconSize: 35,
            onPressed: () {
              selectedPage.jumpToPage(3);
            },
            icon: const Icon(
              Icons.quiz_outlined,
              size: 33,
              color: Colors.white,
            ),
          ),
          IconButton(
            isSelected: true,
            iconSize: 30,
            onPressed: () {
              selectedPage.jumpToPage(4);
            },
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ]),
      ),

      body: PageView(
        controller: selectedPage,
        children: const <Widget>[
          Center(
            child: MealPlannerPage(),
          ),
          Center(
            child: DictPage(),
          ),
          Center(
            child: FoodML(),
          ),
          Center(
            child: QuizzPage(),
          ),
          Center(
            child: ProfilePage(),
          ),
        ],
      ),

      // key: _bottomNavigationKey,
      // body: const [
      //   MealPlannerPage(),
      //   FoodML(),
      //   DictPage(),
      //   QuizzPage(),
      //   ProfilePage(),
      // ][_page],
      // backgroundColor: Colors.transparent,
      // bottomNavigationBar: CurvedNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     color: Colors.orange,
      //     animationDuration: const Duration(milliseconds: 300),
      //     buttonBackgroundColor: Colors.orange.shade100,
      //     onTap: (index) {
      //       setState(() {
      //         _page = index;
      //       });
      //     },
      //     items: [
      //       Icon(
      //         Icons.dinner_dining_sharp,
      //         size: 30,
      //         color: Colors.grey.shade600,
      //       ),
      //       Image.asset(
      //         'assets/icons/home_camera.png',
      //         width: 30,
      //         height: 30,
      //         color: Colors.grey.shade600,
      //       ),
      //        Image.asset(
      //         'assets/icons/dictionary.png',
      //         width: 33,
      //         height: 33,
      //         color: Colors.grey.shade600,
      //       ),
      //       Icon(
      //         Icons.quiz_outlined,
      //         size: 30,
      //         color: Colors.grey.shade600,
      //       ),
      //       Icon(
      //         Icons.person,
      //         size: 30,
      //         color: Colors.grey.shade600,
      //       ),
      //     ]),

      //// First Nav Bar
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
