import 'package:flutter/material.dart';
import 'package:bellava/Models/orders.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Order> myOrders;




  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myOrders

   });
}