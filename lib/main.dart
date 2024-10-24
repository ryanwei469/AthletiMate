import 'package:athletimate/dashboard.dart';
import 'package:athletimate/maps.dart';
import 'package:athletimate/profile.dart';
import 'package:athletimate/search.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Search()
    );
  }
}
