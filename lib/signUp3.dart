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