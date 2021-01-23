import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';

class BackGradient extends StatefulWidget {
  String title = "Lavado";
  double height = 100;

  BackGradient({Key key, this.title, this.height}); //hei

  @override
  _BackGradientState createState() => _BackGradientState();
}

class _BackGradientState extends State<BackGradient> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    widget.height ??= screenHeight;

    return Container(
      width: screenWidth,
      height: widget.height,
      color: Colors.white38,

      child: Stack(
            alignment: Alignment(1.6, -1.7),
        children: [
          Container(
            // width: 300,
            child: FittedBox(
              fit: BoxFit.none,
              // alignment: Alignment(-1.3, 2.5),
              child: 
                  Container(
                    width: 250 ,
                    height: 250 ,
                    decoration: BoxDecoration(
                      color: opacityCeleste2,
                      borderRadius: BorderRadius.circular(screenHeight / 2),
                    ),
                  ),
                
            ),
          ),
          Positioned(
            bottom: screenHeight / 1.7,
            right: screenWidth / 2.0,
            child: 
                Container(
                  margin: EdgeInsets.only(top: 120, left: 100),
                  width: screenHeight /7,
                  height: screenHeight /7,
                  decoration: BoxDecoration(
                    color: Color(0xffF3EfF9),
                    borderRadius: BorderRadius.circular(screenHeight / 2),
                  ),
                ),
              
          ),
          Positioned(
            bottom: -45,
            left: -100,
            child: 
                Container(
                  margin: EdgeInsets.only(top: 420, left: 20),
                  width: screenHeight /3,
                  height: screenHeight /3,
                  decoration: BoxDecoration(
                    color: Color(0xffF3EfF9),
                    borderRadius: BorderRadius.circular(screenHeight / 2),
                  ),
                ),
              
          ),
        
        ],
      ),
    
    );
  }
}
