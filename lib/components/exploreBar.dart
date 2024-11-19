import 'package:athletimate/chatList.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ExploreBar extends StatelessWidget implements PreferredSizeWidget {
  // For bottombar
  final FocusNode searchFocusNode;

  ExploreBar({required this.searchFocusNode});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // removes the default back arrow
      backgroundColor: Colors.white, // Optional: Set background color
      toolbarHeight: 150,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First row: Explore text (centered) and chat icon (right)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatList())
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 50, // Adjust as needed
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[800]!), // Dark grey border
            ),
            child: TextField(
              focusNode: searchFocusNode, // Attach the passed FocusNode here
              decoration: InputDecoration(
                hintText: "Search", // Placeholder text
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[850],
                ),
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust padding
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0); // Adjust height as needed
}
