import 'package:flutter/material.dart';

AppBar TopBar(BuildContext context, String title) {
  return AppBar(
    leading: const SizedBox.shrink(),
    leadingWidth: 0,
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("Athletimate"),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              Center(child: Text(title)), // Use the passed title here
            ],
          ),
        ),
      ],
    ),
  );
}