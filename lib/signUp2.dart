import 'package:athletimate/components/customDropdown.dart';
import 'package:athletimate/components/customSelection.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/model/User.dart';
import 'package:athletimate/signUp3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget{
  const SignUp2({
    super.key, 
    required this.name, 
    required this.email, 
    required this.pwd,
  });
  final String name, email, pwd;

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, String> _dob = {
    'month': "Month",
    'day': "",
    'year': "",
  };

  List<String> _selectedSports = [];

  void _onDateOfBirthSelected(Map<String, String> dob) {
    setState(() {
      _dob = dob;
    });
  }

  void _onSelectionChanged(List<String> selectedSports) {
    setState(() {
      _selectedSports = selectedSports;
    });
  }

  // A function to create a new user
  Future<void> _createUser() async {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.pwd,
      );

      // Extract user details
      User firebaseUser = userCredential.user!;
      final user = UserModel(
        userId: firebaseUser.uid,
        name: widget.name,
        email: widget.email,
        pwd: widget.pwd,
        dob: '${_dob['month']}/${_dob['day']}/${_dob['year']}', // Format DOB
        selectedSports: _selectedSports,
      );

      // Save user to Firestore
      await _firestore.collection('users').doc(user.userId).set({
        'name': user.name,
        'email': user.email,
        'pwd': user.pwd,
        'dob': user.dob,
        'selectedSports': user.selectedSports
      });

      // Navigate to the next screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SignUp3()),
      );
    } catch (e) {
      // Handle errors here
      print('Error during user creation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Date of Birth"),
              ),
              CustomDropdown(onDateOfBirthSelected: _onDateOfBirthSelected),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Sports Tag Selection"),
              ),
              CustomSelection(onSelectionChanged: _onSelectionChanged),
              Center(
                child: ElevatedButton(
                  onPressed: _createUser,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF1145A8)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30))
                  ),
                  child: Text("Continue")
                ),
              )
            ]
          ),
        ),
        
      )
    );
  }
}