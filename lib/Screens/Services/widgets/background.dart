import 'package:flutter/material.dart';


class BackGradient extends StatefulWidget {

  String title = "Lavado";
  double height = 100;

  BackGradient({Key key, this.title, this.height});//hei

  @override
  _BackGradientState createState() => _BackGradientState();
}

class _BackGradientState extends State<BackGradient> {
  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if(widget.height == null){
      widget.height = screenHeight;
    }


    return Container (
      width: screenWidth,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:[
              Colors.white,
              Colors.white,
            ],
            begin: FractionalOffset(0.2, 1.7),
            end: FractionalOffset(1.0, 0.5),
            stops: [1.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),

      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(0.6, -5.5),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color:  Colors.cyan[400],
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),

      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),*/

      //alignment: Alignment(-0.9, -0.6),
    );
  }
}