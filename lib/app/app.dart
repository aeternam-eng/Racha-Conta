import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app/blocs/app_bloc.dart';
import 'package:hello_world/app/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  final AppBloc bloc = AppBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meu Aplicativo',
        theme: ThemeData(
          brightness: Brightness.dark,
          //primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
