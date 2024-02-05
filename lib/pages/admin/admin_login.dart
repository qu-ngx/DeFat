import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nufit/components/loginout_button.dart';
import 'package:nufit/pages/admin/add_quiz.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.yellow,
                    Colors.yellow,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 110.0))),
            ),
            Container(
              margin: const EdgeInsets.only(),
              child: Form(
                child: Column(
                  children: [
                    const Text(
                      "Welcome to admin console!",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            // Username box
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: usernamecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter username";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 160, 160, 147))),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 35,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 160, 160, 147))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            SignInOutButton(onTap: () {}, signState: "Login")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your id is not correct",
            style: TextStyle(fontSize: 18.0),
          )));
        } else if (result.data()['password'] !=
            usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your password is not correct",
            style: TextStyle(fontSize: 18.0),
          )));
        } else {
          Route route = MaterialPageRoute(builder: (context) => AddQuiz());
        }
      });
    });
  }
}
