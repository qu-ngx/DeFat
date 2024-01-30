import 'package:flutter/material.dart';

class SignInOutButton extends StatelessWidget {
  final Function()? onTap;
  final String signState;

  const SignInOutButton(
      {super.key, required this.onTap, required this.signState});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: Text(
            signState,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )),
        ));
  }
}
