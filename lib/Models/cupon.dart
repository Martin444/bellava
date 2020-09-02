import 'package:flutter/material.dart';

class Cupon {
  final String name;
  final int descuento;
  final bool used;
  final DateTime valido;

  Cupon( {Key key,this.name, this.descuento, this.used, this.valido});
}
