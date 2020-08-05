import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app/blocs/app_bloc.dart';

import 'package:hello_world/app/pages/extra_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AppBloc bloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Teste de Inteligência"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Aperte aqui"),
          onPressed: () {
            bloc.increment();
            Future.delayed(Duration(milliseconds: 3000), () {
              bloc.addToMessage();
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExtraPage()),
            );
          },
        ),
      ),
    );
  }
}
