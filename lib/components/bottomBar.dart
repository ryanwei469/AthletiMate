import 'package:athletimate/dashboard.dart';
import 'package:athletimate/maps.dart';
import 'package:athletimate/profile.dart';
import 'package:athletimate/search.dart';
import 'package:flutter/material.dart';

// Simpler code
class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Maps()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Search()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        // ClipPath(
        //   clipper: WaveClipper(),
        //   child: Image.asset(
        //     "assets/bottomImage.jpg",
        //     width: MediaQuery.of(context).size.width,
        //     height: 100,
        //     fit: BoxFit.cover, // Use cover to maintain aspect ratio
        //   ),
        // ),
        Image.asset(
          "assets/bottomImage.jpg", // your image url goes here
          width: MediaQuery.of(context).size.width,
          height: 100,
          fit: BoxFit.fill, // gave the image a 40% height of screen size // to cover the entire target box
        ),
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBottomNavItem(Icons.home, 0),
              _buildHorizontalLine(), 
              _buildBottomNavItem(Icons.location_on_rounded, 1),
              _buildHorizontalLine(),
              _buildBottomNavItem(Icons.search_rounded, 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onTapped(index),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildHorizontalLine() {
    return Container(
      width: 50, // Length of the line between the icons
      height: 2, // Thickness of the line
      color: Colors.white, // Color of the line
      margin: const EdgeInsets.symmetric(vertical: 20), // Adjust to center between icons
    );
  }
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     // Start from the bottom left corner
//     path.lineTo(0, size.height);
    
//     // Half wave on the left
//     path.quadraticBezierTo(size.width * 0.25, size.height - 40, size.width * 0.5, size.height);
    
//     // Full wave in the center
//     path.quadraticBezierTo(size.width * 0.75, size.height + 40, size.width, size.height);
//     path.quadraticBezierTo(size.width * 1.25, size.height - 40, size.width * 1.5, size.height); // Peak to peak of full wave

//     // Half wave on the right
//     path.quadraticBezierTo(size.width * 1.75, size.height + 40, size.width, size.height);
    
//     // Close the path
//     path.lineTo(size.width, size.height);
//     path.close();
    
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true; // You can optimize this depending on your use case
//   }
// }
