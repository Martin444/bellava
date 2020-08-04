import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cardOrder.dart';


class AllOrders extends StatefulWidget {
  User user;

  AllOrders(this.user);
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('orders').where("userOwnerID", isEqualTo: widget.user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

        if(!snapshot.hasData || snapshot.hasError){
          print(snapshot);
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
          AsyncSnapshot order = snapshot;


          List<CardOrder> cards = new List<CardOrder>();

          if(order.data != null){
             order.data.documents.forEach((f){
              var order = Order(
                uid: f.documentID,
                type: f['type'],
                state: f['state'],
                description: f['description'],
                neighborhood: f['neighborhood'],
                typePayment: f['typePayment'],
                typeHouse: f['typeHouse'],
                latitude: f['latitude'],
                longitude: f['longitude'],
                direction: f['direction'],
                recolectionStart: f['recolectionStart'],
                numberPhone: f['numberPhone'],
                services: f['services'],
                flexible: f['flexible'],
                profesionalID: f['profesionalID'],
                profesionalName: f['profesionalName'],
                price: f['price'],
                stars: f['stars']
              );

              order.profesionalID != null ?
                cards.add(CardOrder(order, widget.user))
                :
                cards.add(CardOrder(order, widget.user));
          });

                
              return Container(
                margin: EdgeInsets.only(top: 140),
                child: ListView(
                    
                    children: cards,
                  ),
              );
        
          } else {
            return Container(
                margin: EdgeInsets.only(top: 140),
                child:  Text("Hola")
              );
          }

         

        }
      }
    );
  }
}