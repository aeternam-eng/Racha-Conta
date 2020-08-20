import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hello_world/app/blocs/overview_bloc.dart';
import 'package:hello_world/app/widgets/numberpickertile_widget.dart';
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
    OverviewBloc _bloc = OverviewBloc();

    var currentValueTextController =
        MoneyMaskedTextController(initialValue: 0.00, leftSymbol: 'R\$');
    var waiterTextController =
        MoneyMaskedTextController(initialValue: 0.00, leftSymbol: 'R\$');
    var individualValueTextController =
        MoneyMaskedTextController(initialValue: 0.00, leftSymbol: 'R\$');

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
                    StreamBuilder<double>(
                      stream: _bloc.outCurrentValue,
                      builder: (context, value) {
                        currentValueTextController.addListener(() {
                          _bloc.updateCurrentValue(
                              currentValueTextController.numberValue);
                        });
                        return NumberTile(
                          title: "VALOR TOTAL",
                          textStyle: TextStyle(fontSize: 32),
                          maskController: currentValueTextController,
                        );
                      },
                    ),
                    StreamBuilder<int>(
                      stream: _bloc.outPaying,
                      builder: (context, value) {
                        var _actualValue = 1;
                        if (value.hasData) {
                          _actualValue = value.data;
                        }
                        return NumberPickerTile(
                          title: "PAGANTES",
                          pickerValue: _actualValue,
                          onChanged: (value) => {_bloc.updatePaying(value)},
                        );
                      },
                    ),
                  ],
                ),
                StreamBuilder<double>(
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder<double>(
                    stream: _bloc.outIndividual,
                    builder: (context, value) {
                      if (value.hasData) {
                        individualValueTextController.updateValue(value.data);
                      }
                      return NumberTile(
                        title: "VALOR INDIVIDUAL",
                        editable: false,
                        textStyle: TextStyle(fontSize: 32),
                        maskController: individualValueTextController,
                      );
                    }),
                StreamBuilder<double>(
                  stream: _bloc.outWaiter,
                  builder: (context, value) {
                    if (value.hasData) {
                      waiterTextController.updateValue(value.data);
                    }
                    return NumberTile(
                      title: "GORJETA",
                      editable: false,
                      textStyle: TextStyle(fontSize: 32),
                      maskController: waiterTextController,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
