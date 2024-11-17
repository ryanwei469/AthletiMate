import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context, "MESSAGES"),
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Text("Photo"),
                    ),
                    Column(
                      children: [
                        Text("Name"),
                        Text("Message")
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}