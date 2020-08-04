import 'package:flutter/material.dart';


class FloatNext extends StatefulWidget {

  final VoidCallback onChanged;
  final IconData iconData;

  FloatNext({@required this.onChanged, this.iconData});

  @override
  FloatNext_State createState() => FloatNext_State();
}

// ignore: camel_case_types
class FloatNext_State extends State<FloatNext> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(
        left: 20,
        bottom: 15
      ),
      alignment: Alignment.bottomRight,
    child: FloatingActionButton(
      elevation: 0,
      backgroundColor: Color(0xFF00d0d3),
      //mini: true,
      tooltip: "Fav",
      onPressed: widget.onChanged,

      child: Icon(
      widget.iconData,
        size: 35,
      ),

    ),
    );
  }
}
