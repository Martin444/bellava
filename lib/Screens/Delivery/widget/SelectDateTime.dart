import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/SliveStiky.dart';

import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DateSelect extends StatefulWidget {
  FormInfo info;
  // User user;

  DateSelect({
    this.info,
    // this.user,
  });

  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  bool isFlexible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: <Widget>[
        BackGradient(),
        Container(
          margin: EdgeInsets.only(top: screenWidth / 4),
          height: screenWidth / 2,
          child: Center(
              child: Column(
            children: <Widget>[
              Text(
                '¿Cuándo necesitas el \nservicio?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),

              //Flex Horario
              Container(
                padding:
                    EdgeInsets.only(left: 10.0, right: 10.0, top: 2),
                margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Puedo ser flexible con el horario",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: "Lato",
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: isFlexible,
                      onChanged: (value) {
                        setState(() {
                          isFlexible = value;
                        });
                      },
                      activeTrackColor: korangelite,
                      activeColor: Color(0xff446F7A),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
        Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.9),
            child: ListSticky(
              info: FormInfo(
                  fecha: "",
                  descripcion: widget.info.descripcion,
                  flexible: isFlexible,
                  calle: "",
                  barrio: widget.info.barrio,
                  vivienda: "",
                  numeroTelefono: widget.info.numeroTelefono,
                  services: widget.info.services,
                  price: widget.info.price,
                  type: widget.info.type),
              // user: widget.user,
            )),
        // BarTop
          SafeArea(
            child: Container(
              width: Get.width,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 90,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Agendar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: FlatButton(
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                      )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

      
      ]),
    );
  }
}
