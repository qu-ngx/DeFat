import 'package:google_sign_in/google_sign_in.dart';
import 'package:nufit/components/loginout_button.dart';
import 'package:nufit/components/profile_textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
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
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.orange),
          ),
        ),
        backgroundColor: Colors.transparent,
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

          const SizedBox(height: 10),

          // Show user's email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 50),

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

          SignInOutButton(signState: "Sign Out", onTap: signUserOut)
        ],
      ),
    );
  }
}
