import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Screens/Delivery/widget/SelectDateTime.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Utils/CalendarCard.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectHourProfesional extends StatefulWidget {
  FormInfo info;
  String userId;
  String userName;
  SelectHourProfesional({
    @required this.info,
    @required this.userId,
    @required this.userName,
  });
  @override
  _SelectHourProfesionalState createState() => _SelectHourProfesionalState();
}

class _SelectHourProfesionalState extends State<SelectHourProfesional> {
  @override
  Widget build(BuildContext context) {
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

            if (snapshot.data.documents.length == 0) {
              return Scaffold(
                body: Stack(
                  children: [
                    BackGradient(),
                    Container(
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.userName.split(' ')[0]} tiene su calendario libre esta semana',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(height: 20),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                // width: 80,
                                height: 45,

                                child: Center(
                                  child: Text(
                                    'Agendar dia y hora',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              color: Color(0xff77D499),
                              onPressed: () {
                                Get.to(DateSelect(info: widget.info));
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              );
            }

            return Scaffold(
              body: Stack(
                children: [
                  BackGradient(),
                  Container(
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Estos son los horarios disponibles para ${widget.userName.split(' ')[0]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: cardes,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
