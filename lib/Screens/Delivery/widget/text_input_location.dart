import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Widget iconData;
  TextInputType tipoTeclado;

  TextInputLocation({
    Key key,
    @required this.hintText,
    @required this.iconData,
    @required this.controller,
    this.tipoTeclado
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextField(
        keyboardType: tipoTeclado,
        controller: controller,
        style: TextStyle(
            fontSize: 16.0,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
        ),

        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon:  iconData,
            fillColor: opacityCeleste2,
            filled: true,
            border:  InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: opacityCeleste2),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: opacityCeleste2),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            )



        ),
      ),

      decoration: BoxDecoration(
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //       color: Colors.black12,
          //       blurRadius: 15.0,
          //       offset: Offset(0.0, 7.0)
          //   )
          // ]
      ),
    );
  }
}