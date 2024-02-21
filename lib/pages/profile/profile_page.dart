import 'package:google_sign_in/google_sign_in.dart';
import 'package:nufit/components/loginout_button.dart';
import 'package:nufit/components/profile_textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nufit/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  // Get the current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // edit field
  Future<void> editField(String field) async {}

  //edit field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.orange, //change your color here
        ),
        automaticallyImplyLeading: true,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              "Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),

          // Profile picture of the current user
          Image.asset(
            "assets/logo/gdsc-logo.jpeg",
            width: 85,
            height: 85,
          ),

          const SizedBox(
            height: 10,
          ),

          Text(
            "GDSC-DPU",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow.shade600,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 1),

          // Show user's email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // user details
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'My details',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),

          // username
          MyTextBox(
              text: 'GDSC @ DePauw University',
              sectionName: 'Username',
              onPressed: () => editField('username')),

          // bio
          MyTextBox(
              text: 'Google Developer Student Club DePauw Chapter',
              sectionName: 'Bio',
              onPressed: () => editField('username')),

          const SizedBox(height: 50),

          SignInOutButton(signState: "Sign Out", onTap: signUserOut),

          const SizedBox(
            height: 400,
          )
        ],
      ),
    );
  }
}
