import 'package:flutter/material.dart';

class ProportionalPage extends StatefulWidget {
  @override
  _ProportionalPageState createState() => _ProportionalPageState();
}

class _ProportionalPageState extends State<ProportionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
