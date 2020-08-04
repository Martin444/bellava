import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';

import 'package:bellava/Screens/Orders/widgets/mapex.dart';
import 'package:bellava/Utils/SIzeConfig.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/button_green.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:latlong/latlong.dart';

class CardOrder extends StatefulWidget {

  Order order;
  User user;

  CardOrder(this.order, this.user);

  @override
  _CardOrderState createState() => _CardOrderState();
}

class _CardOrderState extends State<CardOrder> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

  List<String> servs = List<String>();
    
    



  @override
  Widget build(BuildContext context) {

    List starsUp;

    bool star1 = false;
    bool star2 = false;
    bool star3 = false;
    bool star4 = false;
    bool star5 = false;


    List<Icon> stars = new List<Icon>();

if (widget.order.stars != null){
    widget.order.stars.forEach((e) { 
    print(e);
    e ?
    stars.add(Icon(Icons.star, color: Colors.amberAccent, size: 38,))
    :
    stars.add(Icon(Icons.star_border, color: Colors.white, size: 38,));
  });
}

      getFeedBack(){
        return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Genial!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 29
              ),
              ),
              content: Container(
                height: 180,
                child: 
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text("Gracias a tu opinión podremos realizar mejores trabajos",
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Selecciona",
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17
                          ),
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            
                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(widget.order.uid).updateData({
                                        'stars' : [
                                          true,
                                          false,
                                          false,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon( !star1 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(widget.order.uid).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          false,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star2 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(widget.order.uid).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star3 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(widget.order.uid).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          true,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star4 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(widget.order.uid).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          true,
                                          true
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star5 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),
                              ]
                            ),
                          ),
                        )
                    ],
                  )
            
              ),
            
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text("Acepto"),
              //     onPressed: (){
              //       Firestore.instance.collection('orders').document(widget.order.uid).updateData({
              //         'state' : 'Aceptado',
              //         'profesional' : widget.user.uid
              //       });
              //       Navigator.pop(context);
              //       Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) =>
              //         new SuccessScreen()
              //       ));
              //     },
              //   )
              // ],
            
            );
          }
        );
      }

      _showBottomSheet() {


        print(widget.order.latitude);
      return showModalBottomSheet(
          useRootNavigator: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        "Mi Ubicación",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Aplicar mapa googleMaps
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 240,
                    child: Mapex(order: widget.order,),
                  ),

                  ButtonGreen(
                   text: "Listo",
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   height: 45,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40))),
            );
          });
    }


    return  Container(
          margin: EdgeInsets.only(top:10, bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: <Widget>[
          DelayedReveal(
              delay: Duration(milliseconds: 300),
              child: Container(
                  width: SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                  color: widget.order.state != "Finalizado" ? Color(0xFFB78DD9) : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  ),
                child: ExpansionTile(
                  leading: Icon(Icons.list, color: Colors.white,),
                  title: Text(widget.order.type,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 21,
                     fontWeight: FontWeight.bold
                     ),
                    ),
                  children: <Widget>[
                    widget.order.profesionalID != null ?
                    DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Nombre del Profesional:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),

                                Text(
                                  "${widget.order.profesionalName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ], 
                            ),
                          ),
                        )
                    :
                    Container(), 
                    DelayedReveal(
                          delay: Duration(milliseconds: 400),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Dia/Hora:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                  ),
                                ),

                                Text(
                                  "${widget.order.recolectionStart}",
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

                                widget.order.flexible ?

                                Text(
                                  "Si",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                                :
                                Text(
                                  "No",
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
                            child: Column(
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
                                  widget.order.direction,
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
                            child: Column(
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
                                  widget.order.typeHouse,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Text(
                                    "Especificacion del servicio",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Column(
                                    children: 
                                      widget.order.services.map((e) => 
                                        e != null ?
                                        Text("$e",
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700
                                        ),
                                      )
                                      :
                                      Container()
                                      ).toList()
                                    ,
                                  )
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
                                  widget.order.description,
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
                                  "${widget.order.price}",
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
                                  widget.order.typePayment,
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
                                  widget.order.numberPhone,
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
                                  widget.order.state,
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

                    widget.order.state != "Finalizado" ?

                        FlatButton(
                          color: korange,
                          child: Text(
                            "Mas detalles",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 19
                            ),
                            
                            ),
                          onPressed: (){
                            _showBottomSheet();
                          },
                          )
                    :

                    Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: getFeedBack,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: stars,
                            ),
                          ),
                        )
                  
                  ],
                ),
              ),
            ),
          
          ],)
        );
     
     
  }
}