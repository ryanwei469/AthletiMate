import 'package:athletimate/components/bottomBar.dart';
import 'package:athletimate/components/exploreBar.dart';
import 'package:athletimate/components/userCard.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // To control the visibility of the bottombar
  final FocusNode _searchFocusNode = FocusNode();
  bool _isBottomBarVisible = true;

  @override
  void initState(){
    super.initState();

    _searchFocusNode.addListener((){
      setState((){
        _isBottomBarVisible = !_searchFocusNode.hasFocus; // Hide BottomBar when focused
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose(); // Dispose the FocusNode when the widget is removed
    super.dispose();
  }

  void _hideKeyboard() {
    FocusScope.of(context).unfocus(); // Remove focus from the text field
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard, // Detect taps outside to remove focus
      child: Scaffold(
        appBar: ExploreBar(
          searchFocusNode: _searchFocusNode
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            ListView.builder(
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
            if (_isBottomBarVisible)
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBar()
              ),
          ],
        ),
      ),
    );
  }
}