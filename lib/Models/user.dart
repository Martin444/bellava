import 'package:flutter/material.dart';
import 'package:bellava/Models/orders.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final String phoneNumber;
  final String adress;
  final String barrio;
  final double latitlude;
  final double longitude;
  final List<Order> myOrders;




  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    @required this.phoneNumber,
    @required this.adress,
    @required this.latitlude,
    @required this.longitude,
    @required this.barrio,
    this.myOrders

   });
}