import 'package:flutter/material.dart';

class PercentageTile extends StatefulWidget {
  final String title;

  const PercentageTile(this.title) : super();

  @override
  _PercentageTileState createState() => _PercentageTileState();
}

class _PercentageTileState extends State<PercentageTile> {
  double _sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              widget.title,
              style: TextStyle(fontFamily: "Roboto"),
            ),
            color: Colors.black26,
            padding: const EdgeInsets.only(top: 7.0, bottom: 0.0),
            alignment: Alignment.topCenter,
          ),
          Container(
            width: double.infinity,
            child: Slider(
                value: _sliderValue,
                min: 0,
                max: 150,
                label: '$_sliderValue',
                onChanged: (double newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                }),
            color: Colors.black26,
            padding: const EdgeInsets.only(right: 70.0, left: 70.0),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
