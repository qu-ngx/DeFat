import 'package:nufit/pages/authenticator/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:nufit/pages/intro_pages/intro_page_1.dart';
import 'package:nufit/pages/intro_pages/intro_page_2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  // keep track to see if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) => {
              setState(() {
                onLastPage = (index == 2);
              }),
            },
            children: [
              // Changes to match with the relative pages
              // const IntroScreen0(),

              const IntroScreen1(),

              const IntroScreen2(),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          // dot indicatators (Count how many pages we have onboarding screen)
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // dot indicator

                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ColorTransitionEffect(
                        activeDotColor: Colors.orange),
                  ),

                  // next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AuthPage();
                            }));
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
