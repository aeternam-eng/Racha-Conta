import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hello_world/app/blocs/overview_bloc.dart';
import 'package:hello_world/app/widgets/numbertile_widget.dart';
import 'package:hello_world/app/widgets/percentagetile_widget.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  OverviewBloc _bloc;

  @override
  void initState() {
    _bloc = OverviewBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NumberTile(
                      title: "VALOR TOTAL",
                      maskController: MoneyMaskedTextController(
                        initialValue: 0.00,
                        leftSymbol: 'R\$',
                      ),
                    ),
                    NumberTile(
                      title: "PAGANTES",
                      maskController: TextEditingController(text: "1"),
                    ),
                  ],
                ),
                PercentageTile("% GORJETA DO GARÇOM"),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 0.0,
            indent: 0.0,
            endIndent: 0.0,
            thickness: 1.0,
          ),
          Container(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumberTile(
                  title: "VALOR INDIVIDUAL",
                  editable: false,
                  maskController: MoneyMaskedTextController(leftSymbol: "R\$"),
                ),
                NumberTile(
                  title: "GORJETA",
                  editable: false,
                  maskController: MoneyMaskedTextController(leftSymbol: "R\$"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
