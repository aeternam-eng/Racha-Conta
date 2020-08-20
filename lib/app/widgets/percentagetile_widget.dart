import 'package:flutter/material.dart';

class PercentageTile extends StatefulWidget {
  const PercentageTile({
    this.title,
    this.sliderValue = 0,
    this.onChanged,
  }) : super();

  final String title;
  final double sliderValue;
  final Function onChanged;

  @override
  _PercentageTileState createState() => _PercentageTileState();
}

class _PercentageTileState extends State<PercentageTile> {
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
              value: widget.sliderValue,
              min: 0,
              max: 50,
              divisions: 50,
              label: '${widget.sliderValue.toInt()}%',
              onChanged: widget.onChanged,
            ),
            color: Colors.black26,
            padding: const EdgeInsets.only(right: 70.0, left: 70.0),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
