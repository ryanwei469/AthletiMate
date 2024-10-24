import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final LinearGradient gradient;

  // Constructor to accept gradient
  const UserCard({Key? key, required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: gradient, // Use the passed gradient
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text("Photo"),
          ),
          SizedBox(width: 8),
          Expanded(
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
                  shrinkWrap: true, // Allows GridView to take up only as much space as needed
                  physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside the card
                  itemBuilder: (context, index) {
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
      ),
    );
  }
}