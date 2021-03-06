import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';

class FloatNext extends StatefulWidget {
  final VoidCallback onChanged;
  final IconData iconData;
  String text = 'Siguiente';

  FloatNext({@required this.onChanged, this.iconData, this.text});

  @override
  FloatNext_State createState() => FloatNext_State();
}

// ignore: camel_case_types
class FloatNext_State extends State<FloatNext> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Container(
        height: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            color: Color(0xff77D499),
            onPressed: widget.onChanged,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    widget.iconData,
                    size: 25,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
