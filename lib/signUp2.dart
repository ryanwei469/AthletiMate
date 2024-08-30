import 'package:athletimate/components/customDropdown.dart';
import 'package:athletimate/components/customSelection.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/signUp3.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SignUp2 extends StatefulWidget{
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Date of Birth"),
              ),
              CustomDropdown(),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Sports Tag Selection"),
              ),
              CustomSelection(),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUp3())
                    );
                  }, 
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