import 'package:nufit/pages/dictionary/dictionary_page.dart';
import 'package:nufit/pages/food_detection/fd_front.dart';
import 'package:nufit/pages/home/home.dart';
import 'package:nufit/pages/meal_planner/meal_planner_page.dart';
import 'package:nufit/pages/quizz/quizz_page.dart';
import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  const NavPage({
    super.key,
  });

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  //// Second Nav Bar
  // int _page = 0;
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  PageController selectedPage = PageController(initialPage: 0);

  final Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(),
        child: BottomAppBar(
          color: Colors.orange,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          surfaceTintColor: Colors.transparent,
          elevation: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: 5,
                  onPressed: () {
                    selectedPage.jumpToPage(0);
                  },
                  icon: Image.asset(
                    'assets/icons/homepage.png',
                    color: _iconColor,
                    height: 40,
                    width: 35,
                  )),
              IconButton(
                iconSize: 80,
                selectedIcon: Image.asset(
                  'assets/icons/s_meals.png',
                  color: _iconColor,
                  height: 200,
                ),
                onPressed: () {
                  selectedPage.jumpToPage(1);
                },
                icon: Image.asset(
                  'assets/icons/meals.png',
                  color: _iconColor,
                  width: 40,
                  height: 200,
                ),
              ),
              const SizedBox(
                width: 95,
              ),
              IconButton(
                iconSize: 15,
                onPressed: () {
                  selectedPage.jumpToPage(3);
                },
                icon: Image.asset(
                  'assets/icons/book.png',
                  color: _iconColor,
                  height: 34,
                ),
              ),
              IconButton(
                iconSize: 33,
                onPressed: () {
                  selectedPage.jumpToPage(4);
                },
                icon: Icon(
                  Icons.quiz_outlined,
                  size: 36,
                  color: _iconColor,
                ),
              ),
            ],
          ),
        ),
      ),

      body: PageView(
        controller: selectedPage,
        children: const <Widget>[
          Center(
            child: HomePage(),
          ),
          Center(
            child: MealPlannerPage(),
          ),
          Center(
            child: FoodML(
              boolLeading: false,
            ),
          ),
          Center(
            child: DictPage(),
          ),
          Center(
            child: QuizzPage(),
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
