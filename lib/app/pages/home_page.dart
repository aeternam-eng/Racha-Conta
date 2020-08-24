import 'package:flutter/material.dart';
import 'package:hello_world/app/pages/overview_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.scaleDown,
        ),
        centerTitle: true,
      ),
      body: OverviewPage(),
    );
  }
}
