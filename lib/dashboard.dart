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
    );
  }
}