import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context, "SETTINGS"),
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // First Container
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[350],
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.thumb_up_off_alt_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Leave Feedback",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Help us to improve our app by giving your valuable feedback",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
          
              // Grouped Containers with Divider
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[350],
                ),
                child: const Column(
                  children: [
                    // First Row in the Group
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: 
                            Text(
                              "Clear Cache",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Divider(color: Colors.black), // Horizontal line
                    SizedBox(height: 5),
          
                    // Second Row in the Group
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.help_outline_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "FAQ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Legal",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

               // Grouped Containers with Divider
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[350],
                ),
                child: const Column(
                  children: [
                    // First Row in the Group
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.insert_drive_file_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Terms and Conditions",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded
                        )
                      ],
                    ),

                    SizedBox(height: 5),
                    Divider(color: Colors.black), // Horizontal line
                    SizedBox(height: 5),
          
                    // Second Row in the Group
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.security_outlined,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Data and privacy",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Sign out
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[350],
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
