import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app/blocs/app_bloc.dart';

class ExtraPage extends StatefulWidget {
  @override
  _ExtraPageState createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> {
  @override
  Widget build(BuildContext context) {
    final AppBloc bloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <StreamBuilder>[
            StreamBuilder(
              stream: bloc.outCounter,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text("Parabéns, você foi burro ${snapshot.data} vezes");
              },
            ),
            StreamBuilder(
              stream: bloc.outMessage,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData)
                  return Text(snapshot.data, textAlign: TextAlign.center);
                else
                  return Container(width: 0, height: 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
