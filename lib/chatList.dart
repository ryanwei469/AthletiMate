import 'package:athletimate/chatDetail.dart';
import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/topBar.dart';
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
      backgroundColor: Colors.white,
      appBar: TopBar(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg2.jpg', // Background image
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 45),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 75),
                    Text(
                      "MESSAGES",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(chat['name']![0]),
                          ),
                          title: Text(
                            chat['name']!,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            chat['lastMessage']!,
                            style: TextStyle(color: Colors.black),
                          ),
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
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
