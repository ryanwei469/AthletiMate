import 'package:athletimate/chatList.dart';
import 'package:flutter/material.dart';

AppBar HomeBar(BuildContext context){
  return AppBar(
    leading: const SizedBox.shrink(),
    leadingWidth: 0,
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