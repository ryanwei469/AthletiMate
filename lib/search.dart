import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/exploreBar.dart';
import 'package:athletimate/components/userCard.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreBar(),
      bottomNavigationBar: BottomBar(),
      body: ListView.builder(
        padding: EdgeInsets.all(10), // Optional: Adjust padding as needed
        itemCount: 10, // Set the number of cards you want to generate
        itemBuilder: (context, index) {
          // Alternate between two gradients based on the index
          final gradient = index.isEven
            ? const LinearGradient(
                colors: [
                  Color(0xFF423FFE),
                  Color(0xFFD630FF),
                ],
              )
            : const LinearGradient(
                colors: [
                  Color(0xFFDCA924),
                  Color(0xFFC32424),
                ],
              );
          return UserCard(gradient: gradient); // Pass the gradient to the card
        },
      ),
    );
  }
}