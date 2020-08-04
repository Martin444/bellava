import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order {
  String uid;
  String type;
  String state;
  String description;
  String neighborhood;
  String typePayment;
  String typeHouse;
  num latitude;
  num longitude;
  //User userOwner;
  String direction;
  String recolectionStart;
  Timestamp deliveryEnd;
  String numberPhone;
  List services;
  bool flexible;
  String profesionalID;
  String profesionalName;
  int price;
  List stars;


  Order({
    Key key,
    this.uid,
    @required this.type,
    @required this.state,
    this.description,
    @required this.neighborhood,
    @required this.typePayment,
    @required this.typeHouse,
    @required this.direction,
    @required this.recolectionStart,
    @required this.numberPhone,
    @required this.latitude,
    @required this.longitude,
    this.services,
    this.flexible,
    this.profesionalID,
    this.profesionalName,
    this.price,
    this.stars
  });



}