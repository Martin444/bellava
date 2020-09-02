import 'package:bellava/Models/cupon.dart';
import 'package:bellava/Screens/Promociones/widget/promo_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCupos extends StatefulWidget {
  @override
  _AllCuposState createState() => _AllCuposState();
}

class _AllCuposState extends State<AllCupos> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('cupones').where('isused', isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

        if(!snapshot.hasData){
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 50.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.white),
                Text("Espere un momento")
              ],
            ),
          );
        } else {
          List<PromoCard> cards =  List<PromoCard>();

          snapshot.data.documents.forEach((e) { 
            var data = Cupon(
              name: e.documentID,
              descuento: e['desc'],
              valido:  e['date']  == null ?  DateTime.now() : ( e['date'] as Timestamp).toDate(),
              used: e['isused']
            );

            cards.add(PromoCard(cupon: data,));
          });

          return Container(
            child: Column(
              children: cards,
            ),
          );
        }

      },
    );
  }
}