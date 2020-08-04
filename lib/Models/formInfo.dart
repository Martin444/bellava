

import 'package:flutter/material.dart';

class FormInfo {
  final String fecha;
  final String descripcion;
  final bool flexible;
  final String calle;
  final String barrio;
  final String vivienda;
  final String numeroTelefono;
  final List services;
  final int price;
  final String type;





  FormInfo({
    Key key,
    @required this.fecha,
    @required this.descripcion,
    @required this.flexible,
    @required this.calle,
    @required this.barrio,
    @required this.vivienda,
    @required this.numeroTelefono,
    this.services,
    @required this.price,
    this.type
   });
}