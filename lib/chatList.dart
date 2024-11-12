import 'package:athletimate/chatDetail.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {'name': 'Alice', 'lastMessage': 'Hey! How are you?'},
    {'name': 'Bob', 'lastMessage': 'Let’s meet tomorrow.'},
    {'name': 'Charlie', 'lastMessage': 'Got the documents.'},
    {'name': 'David', 'lastMessage': 'See you at the event.'},
    {'name': 'Eve', 'lastMessage': 'Thanks for the help!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(chat['name']![0]),
            ),
            title: Text(chat['name']!),
            subtitle: Text(chat['lastMessage']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetail(
                    userName: chat['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
