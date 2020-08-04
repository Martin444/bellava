import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/SliveStiky.dart';

import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class DateSelect extends StatefulWidget {

  FormInfo info;
  User user;

  DateSelect({
    this.info,
    this.user,
    
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
      body: Stack(
        children:<Widget>[
              Column(
                children: <Widget>[
                      ProfileHeader(2.8),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:screenWidth / 6, left: 10),
                height: screenWidth / 2,
                child: Center(
                        child: Column(
                          children: <Widget>[
                            Text("¿Cuándo necesitas el servico?",
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                                            //Flex Horario
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2, bottom: 2),
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 7.0))
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Puedo ser flexible con el horario",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: "Lato",
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: isFlexible,
                        onChanged: (value) {
                          setState(() {
                            isFlexible = value;
                          });
                        },
                        activeTrackColor: korangelite,
                        activeColor: korange,
                      )
                    ],
                  ),
                ),
               
        
                          ],
                        )
                        ),
              ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.9),
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
                  type: widget.info.type
                ),
              user: widget.user,
              )),
        ]
      ),
    );
  }
}