import 'package:bellava/Utils/SIzeConfig.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';

class ListMenu extends StatefulWidget {
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top:140),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: <Widget>[
          DelayedReveal(
              delay: Duration(milliseconds: 300),
              child: Container(
                  width: SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                  color: Color(0xFFB78DD9),
                  borderRadius: BorderRadius.circular(20),
                  ),
                child: ExpansionTile(
                  leading: Icon(Icons.list, color: Colors.white,),
                  title: Text("Belleza de Manos",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 21,
                     fontWeight: FontWeight.bold
                     ),
                    ),
                  children: <Widget>[
                      DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Dia/Hora",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "20:31 3/04/22",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),
                      
                      
                      DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "¿Horario Flexible?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "Si",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),

                         DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Dirección:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "Av.Siempre Viva",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),


                         DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Tipo de vivienda",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "Departamennto",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),

                         DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 2.38,
                                  child: Text(
                                    "Especificacion del servicio",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  child: Text(
                                    " 1 Uñas esculpidas con gel",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),

                        
                         DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Comentarios",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "No hay comentarios",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),
                        
                         DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total pagado",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "5000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),

                        DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Método de pago",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "Débito",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),


                        DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Teléfono",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "3873333333",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),

                        DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Estado del pedido",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "Procesando",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          
          ],)
        ),
     
     
      ],
    );
  }
}