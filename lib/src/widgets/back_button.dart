import 'package:flutter/material.dart';
import '../constants.dart';

class backButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                child: IconButton(
                  icon: new Icon(Icons.arrow_back),
                  iconSize: 28,
                  color: Colors.black87,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
