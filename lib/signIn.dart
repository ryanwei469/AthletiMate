import 'package:athletimate/components/customDropdown.dart';
import 'package:athletimate/components/customSelection.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/dashboard.dart';
import 'package:athletimate/signUp2.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 45, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 90),
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // Email Address Field
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "Email Address:",
                                    style: TextStyle(color: Colors.white), // Change label color to white
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  style: TextStyle(color: Colors.black), // Change input text color to white
                                  obscureText: false,
                                  autocorrect: true,
                                  enableSuggestions: false,
                                  cursorColor: Colors.white, // Cursor color set to white
                                  decoration: InputDecoration(
                                    filled: true, // Fill background with color
                                    fillColor: Colors.white, // Set background color to white
                                    hintText: "Enter Your Email Here",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey, // Hint text color
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Password Field
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "Password:",
                                    style: TextStyle(color: Colors.white), // Change label color to white
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.black), // Change input text color to white
                                  obscureText: true,
                                  autocorrect: true,
                                  enableSuggestions: false,
                                  cursorColor: Colors.white, // Cursor color set to white
                                  decoration: InputDecoration(
                                    filled: true, // Fill background with color
                                    fillColor: Colors.white, // Set background color to white
                                    hintText: "Enter Your Password",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey, // Hint text color
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 275),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                        // email: _emailController.text,
                                        // pwd: _passwordController.text,
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Color(0xFF1145A8)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(vertical: 15),
                                  ),
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
