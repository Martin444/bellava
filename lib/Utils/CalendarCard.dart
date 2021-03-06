import 'package:bellava/Models/user.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalendarCard extends StatefulWidget {
  String dia;
  String hora;
  String profesionalID;
  String cardID;
  DateTime date;
  bool ocuped;
  User user;

  CalendarCard({
    @required this.dia,
    @required this.hora,
    @required this.date,
    @required this.ocuped,
    this.profesionalID,
    this.cardID,
  });
  @override
  _CalendarCardState createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  @override
  Widget build(BuildContext context) {
    var refer = widget.date.difference(DateTime.now());
    print(widget.hora);
    if (refer.inHours <= 0) {
      Firestore.instance
          .collection('users')
          .document(widget.profesionalID)
          .collection('calendar')
          .document(widget.cardID)
          .delete()
          .then((v) => print('hola'));
    }
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.ocuped ? opacityPink1 : opacityCeleste1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.dia}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${widget.hora}:00 hs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
