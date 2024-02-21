import 'package:nufit/components/my_textfield.dart';
import 'package:nufit/components/loginout_button.dart';
import 'package:nufit/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nufit/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
    } on FirebaseAuthException catch (e) {
      // Pop the loading circles
      // ignore: use_build_context_synchronously
      // Catch errors with messages to users
      switch (e.code) {
        case 'user-not-found':
          errorLogInMessage(
              "There is no account with the listing information. Please try again or create a new account!");
        case 'invalid-email':
          errorLogInMessage("Invalid email. Please check email again!");
        case 'user-disabled':
          errorLogInMessage(
              "Your account is locked. Please contact the admin for more!");
        case 'wrong-password':
          errorLogInMessage("Invalid password for existed account");
      }
    }
  }

  void errorLogInMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                "assets/icons/NuFit.PNG",
                width: 175,
                height: 165,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "         Welcome to ",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "Nu",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    "Fit",
                    style: TextStyle(fontSize: 28, color: Colors.grey),
                  ),
                  // Profile Icon
                  SizedBox(
                    width: 80,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Are you ready for a fitter body and healthier meals?",
                style: TextStyle(
                    color: Colors.orange.shade300,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              // draw forgot password text
              const SizedBox(height: 8),

              // forgot the password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Sign-in button
              SignInOutButton(signState: "Sign In", onTap: signUserIn),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              // Google sign in symbol (to be added features)

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'assets/icons/google.png')
                ],
              ),
              const SizedBox(height: 30),

              // not a member? register text button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member?"),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
