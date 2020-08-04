import 'package:flutter/material.dart';

class BarTop extends StatefulWidget {
  @override
  _BarTopState createState() => _BarTopState();
}

class _BarTopState extends State<BarTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 50,
            child: Icon(Icons.arrow_back_ios),
          ),)
        ],
      ),
    );
  }
}