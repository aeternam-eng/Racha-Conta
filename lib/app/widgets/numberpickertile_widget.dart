import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerTile extends StatefulWidget {
  const NumberPickerTile({
    Key key,
    this.title = "default",
    this.onChanged,
    this.pickerValue = 1,
  }) : super(key: key);

  final String title;
  final Function onChanged;
  final int pickerValue;

  @override
  _NumberPickerTileState createState() => _NumberPickerTileState();
}

class _NumberPickerTileState extends State<NumberPickerTile> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        color: Colors.black26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                widget.title,
                style: TextStyle(fontFamily: "Roboto"),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(bottom: 15.0),
              child: NumberPicker.horizontal(
                  initialValue: widget.pickerValue,
                  minValue: 1,
                  maxValue: 50,
                  listViewHeight: 32.0,
                  highlightSelectedValue: true,
                  onChanged: widget.onChanged),
            ),
          ],
        ),
      ),
    );
  }
}
