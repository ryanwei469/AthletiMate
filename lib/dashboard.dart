import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/homeBar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(context),
      bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF423FFE),
                    Color(0xFFD630FF)
                  ]
                )
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text("Photo"),
                  ),
                  SizedBox(width: 8),
                  Expanded( // Use Expanded to fill the available width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name | Age",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            mainAxisExtent: 30,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemCount: 8,
                          shrinkWrap: true, // Add this to allow it to take up only as much space as needed
                          physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                          itemBuilder: (count, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[300],
                              ),
                              child: Text(
                                "Sport tag",
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Text("Your location"),
            const Divider(
              color: Colors.grey, // Color of the line
              height: 25, // Space above and below the line
              thickness: 1, // Thickness of the line
              indent: 10,
              endIndent: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Recommended for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFDCA924),
                    Color(0xFFC32424)
                  ]
                )
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text("Photo"),
                  ),
                  SizedBox(width: 8),
                  Expanded( // Use Expanded to fill the available width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name | Age",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black,
                              ),
                              child: Text("Follow",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            mainAxisExtent: 30,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemCount: 8,
                          shrinkWrap: true, // Add this to allow it to take up only as much space as needed
                          physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                          itemBuilder: (count, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[300],
                              ),
                              child: Text(
                                "Sport tag",
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}