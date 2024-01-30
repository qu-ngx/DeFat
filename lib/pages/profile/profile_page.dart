import 'package:defat/components/loginout_button.dart';
import 'package:defat/components/profile_textbox.dart';
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
  }

  // Get the current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // edit field
  Future<void> editField(String field) async {}

  //edit field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),

          // Profile picture of the current user
          const Icon(
            Icons.person,
            size: 72,
          ),

          const SizedBox(height: 10),

          // Show user's email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(height: 50),

          // user details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'My details',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // username
          MyTextBox(
              text: 'None',
              sectionName: 'username',
              onPressed: () => editField('username')),

          // bio
          MyTextBox(
              text: 'None',
              sectionName: 'bio',
              onPressed: () => editField('username')),

          const SizedBox(height: 70),

          SignInOutButton(signState: "Sign Out", onTap: signUserOut)
        ],
      ),
    );
  }
}
