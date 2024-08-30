import 'package:flutter/material.dart';

AppBar TopBar(BuildContext context){
  return AppBar(
    leading: const SizedBox.shrink(),
    leadingWidth: 0,
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("Athletimate"),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.grey
                )
              ),
              SizedBox(
                width: 100,
              ),
              Text("Sign Up")
            ],
          ),
        )
      ],
    ),
  );
}