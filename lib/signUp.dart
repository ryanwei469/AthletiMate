import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/signUp2.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Full Name:"),
                    ),
                    TextFormField(
                      validator: (value) {},
                      controller: _fullNameController,
                      obscureText: false,
                      autocorrect: true,
                      enableSuggestions: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Your Full Name Here",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1, style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(4)
                        )
                      )
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Email Address:"),
                    ),
                    TextFormField(
                      validator: (value) {},
                      controller: _fullNameController,
                      obscureText: false,
                      autocorrect: true,
                      enableSuggestions: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Your Full Name Here",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1, style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(4)
                        )
                      )
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Password:")
                    ),
                    TextFormField(
                      validator: (value) {},
                      controller: _fullNameController,
                      obscureText: true,
                      autocorrect: true,
                      enableSuggestions: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1, style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(4)
                        )
                      )
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUp2())
                  );
                }, 
                child: Text("Continue")
              )
            ],
          ),
        ),
      )
    );
  }
}