import 'package:bellava/Screens/Home/home.dart';
import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';



class SuccessScreen extends StatefulWidget {

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ProfileHeader(0),
          Container(
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 9.0,
              percent: 1.0,
              animateFromLastPercent: true,
              animationDuration: 3000,
              animation: true,
              backgroundColor: Colors.white,
              center: new Text("Procesando",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                  fontWeight: FontWeight.w400
              ),
              ),
              footer: Container(
                margin: EdgeInsets.only(top: 10),
                child: DelayedReveal(
                  delay: Duration(milliseconds: 2500),
                  child: new Text(
                    "Listo!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              progressColor: korange,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              child: Icon(
                Icons.home
              ),
              backgroundColor: korange,
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new HomeScreen()
                      ));
              },
            ),
          ),



        ],
      ),
    );
  }
}