import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';


class ButtonPurple extends StatelessWidget {

  final String buttonText;
  final VoidCallback onPressed;

  ButtonPurple({
    Key key,
    @required this.buttonText,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
            // top: 30.0,
            // left: 20.0,
            // right: 20.0,
            bottom: 10
        ),
        height: 30.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xff77D499)
        ),

        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white
            ),

          ),
        ),

      ),
    );
  }

}