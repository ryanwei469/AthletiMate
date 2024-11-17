import 'package:flutter/material.dart';

AppBar TopBar(BuildContext context) {
  return AppBar(
    leading: const SizedBox.shrink(),
    leadingWidth: 0,
    toolbarHeight: 50,
    backgroundColor: Colors.white,
    elevation: 0, // Optional: Remove shadow if desired
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("Athletimate"),
        ),
      ],
    ),
  );
}
