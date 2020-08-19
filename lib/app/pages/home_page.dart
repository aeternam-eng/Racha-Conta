import 'package:flutter/material.dart';
import 'package:hello_world/app/pages/overview_page.dart';
import 'package:hello_world/app/pages/individual_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rachaê meu ermão"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.group)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewPage(),
            IndividualPage(),
          ],
        ),
      ),
    );
  }
}
