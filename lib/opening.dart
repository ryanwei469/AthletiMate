import 'package:athletimate/signIn.dart';
import 'package:athletimate/signUp.dart';
import 'package:flutter/material.dart';

class Opening extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5271FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ATHLETIMATE",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUp())
                );
              }, 
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF1145A8)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30))
              ),
              child: Text("Sign Up")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignIn())
                );
              }, 
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF1145A8)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30))
              ),
              child: Text("Sign In")
            )
          ],
        ),
      ),
    );
  }
}