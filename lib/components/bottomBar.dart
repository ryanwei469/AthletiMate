import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget{
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.asset(
          "assets/bottomImage.jpg", // your image url goes here
          width: MediaQuery.of(context).size.width,
          height: 100,
          fit: BoxFit.fill, // gave the image a 40% height of screen size // to cover the entire target box
        ),
        BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              label: "",
              backgroundColor: Colors.transparent
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_rounded,
                color: Colors.white,
                size: 30,
              ),
              label: "",
              backgroundColor: Colors.transparent
            ),
          ],
        ),
      ],
    );
  }
}