import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hello_world/app/blocs/individual_bloc.dart';
import 'package:hello_world/app/widgets/numbertile_widget.dart';
import 'package:hello_world/app/widgets/percentagetile_widget.dart';

class IndividualPage extends StatefulWidget {
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  IndividualBloc _bloc = IndividualBloc();

  var currentValueTextController =
      MoneyMaskedTextController(initialValue: 0.00, leftSymbol: 'R\$');
  var percentageTextController = TextEditingController(text: "");
  var payingTextController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      left: 25.0,
                      right: 25.0,
                      bottom: 25.0,
                    ),
                    child: StreamBuilder<double>(
                      stream: _bloc.outPercentage,
                      builder: (context, value) {
                        var _actualValue = 0.0;
                        if (value.hasData) {
                          _actualValue = value.data;
                        }
                        return PercentageTile(
                          title: "% GORJETA DO GARÇOM",
                          onChanged: (value) => {_bloc.updatePercentage(value)},
                          sliderValue: _actualValue,
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    indent: 0.0,
                    endIndent: 0.0,
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          /* ListView.separated(
            itemBuilder: null,
            separatorBuilder: null,
            itemCount: null,
          ), */
        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.bottomCenter,
        constraints: BoxConstraints.loose(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 11)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<int>(
              stream: _bloc.outPaying,
              builder: (context, value) {
                if (value.hasData) {
                  payingTextController.value =
                      TextEditingValue(text: value.requireData.toString());
                }
                return NumberTile(
                  title: "PAGANTES",
                  editable: false,
                  textStyle: TextStyle(fontSize: 20),
                  maskController: payingTextController,
                );
              },
            ),
            StreamBuilder<double>(
              stream: _bloc.outPercentage,
              builder: (context, value) {
                if (value.hasData) {
                  percentageTextController.value = TextEditingValue(
                      text: (value.requireData.toInt().toString() + '%'));
                }
                return NumberTile(
                  title: "% GORJETA:",
                  editable: false,
                  maskController: percentageTextController,
                  textStyle: TextStyle(fontSize: 20),
                );
              },
            ),
            NumberTile(
              title: "VALOR TOTAL:",
              editable: false,
              textStyle: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
