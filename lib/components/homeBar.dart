import 'package:athletimate/chatList.dart';
import 'package:athletimate/settings.dart';
import 'package:flutter/material.dart';

AppBar HomeBar(BuildContext context){
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.settings),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Settings())
        );
      },
    ),
    // SizedBox.shrink(),
    leadingWidth: 40,
    toolbarHeight: 50,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("ATHLETIMATE"),
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChatList())
            );
          },
          child: Icon(
            Icons.chat_rounded
          ),
        )
      ],
    )
  );
}