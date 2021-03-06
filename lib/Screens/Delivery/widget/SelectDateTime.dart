import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/masajes.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/widget/SliveStiky.dart';

import 'package:bellava/Screens/Home/widget/profileHeader.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Utils/CalendarCard.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DateSelect extends StatefulWidget {
  FormInfo info;
  String userId;
  String userName;

  DateSelect({
    this.info,
    @required this.userId,
    @required this.userName,
  });

  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  bool isFlexible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(widget.userId)
            .collection('calendar')
            .orderBy('date', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var cardes = <CalendarCard>[];
            snapshot.data.documents.forEach((e) {
              var carID = e.documentID;
              var dia = e.data['dia'];
              var hora = e.data['hora'];
              var date = (e.data['date'] as Timestamp).toDate();
              var ocuped = e.data['ocuped'];
              cardes.add(
                CalendarCard(
                  dia: dia,
                  hora: hora,
                  ocuped: ocuped,
                  date: date,
                  cardID: carID,
                  profesionalID: widget.userId,
                ),
              );
            });
            print(snapshot.data.documents.length);

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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      cardes.length == 0
                          ? Container()
                          : Column(children: <Widget>[
                              Text('Horarios seleccionados por el profesional',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                              Column(
                                children: cardes,
                              ),
                            ]),
                      //Flex Horario
                      Container(
                        padding: EdgeInsets.only(
                          left: 0.0,
                          right: 10.0,
                          top: 2,
                        ),
                        margin: EdgeInsets.only(
                          top: 10.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Puedo ser flexible con el horario',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'Lato',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.9),
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
                        type: widget.info.type,
                      ),
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
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
