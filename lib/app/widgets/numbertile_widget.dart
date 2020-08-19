import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTile extends StatefulWidget {
  const NumberTile({
    Key key,
    this.title = "default",
    this.maskController,
    this.editable = true,
  }) : super(key: key);

  final bool editable;
  final String title;
  final TextEditingController maskController;

  @override
  _NumberTileState createState() => _NumberTileState();
}

class _NumberTileState extends State<NumberTile> {
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
              child: TextField(
                enabled: widget.editable,
                showCursor: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0, fontFamily: "Roboto"),
                keyboardType: TextInputType.number,
                controller: widget.maskController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  isDense: false,
                  isCollapsed: false,
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
