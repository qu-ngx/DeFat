import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 130, bottom: 280, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1.0, color: Colors.orange.shade500),
              right: BorderSide(width: 1.0, color: Colors.orange.shade500),
              left: BorderSide(width: 1.0, color: Colors.orange.shade500)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/splash/splash3.png",
              width: 190,
              height: 190,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Create perfect diets",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
