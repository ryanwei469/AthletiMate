import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/dashboard.dart';
import 'package:flutter/material.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg3.jpg'), // Replace with your image file
            fit: BoxFit.cover, // Cover the whole screen
            scale: 0.5
          ),
        ),
        child: Center( // Centering the content on top of the background
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize the column to fit its children
              crossAxisAlignment: CrossAxisAlignment.center, // Center align the column's content
              children: [
                const Text(
                  "ADD A PROFILE PHOTO",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Make the text white to contrast with background
                  ),
                ),
                const SizedBox(height: 40), // Space between title and avatar
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30), // Space between avatar and button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1145A8)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                    ),
                    child: const Text(
                      "Add a photo",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Space between button and "Skip" text
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
