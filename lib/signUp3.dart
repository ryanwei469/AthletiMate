import 'package:athletimate/dashboard.dart';
import 'package:flutter/material.dart';

class SignUp3 extends StatefulWidget{
  const SignUp3({super.key});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ADD A PROFILE PHOTO"),
            CircleAvatar(
              radius: 80,
              child: Icon(
                Icons.person
              ),
            ),
            ElevatedButton(
              onPressed: (){}, 
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF1145A8)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30))
              ),
              child: Text("Add a photo")
            ),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Dashboard())
                  );
                },
                child: Text("Skip"),
              ),
            )
          ],
        ),
      ),
    );
  }
}