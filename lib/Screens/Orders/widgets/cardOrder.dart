import 'package:bellava/Models/orders.dart';
import 'package:bellava/Models/user.dart';

import 'package:bellava/Screens/Orders/widgets/mapex.dart';
import 'package:bellava/Screens/controllers/Order_controller.dart';
import 'package:bellava/Utils/SIzeConfig.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/button_green.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:latlong/latlong.dart';

class CardOrder extends StatefulWidget {
  Order order;
  // User user;

  CardOrder(
    this.order,
  );

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

    if (widget.order.stars != null) {
      widget.order.stars.forEach((e) {
        e
            ? stars.add(Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 38,
              ))
            : stars.add(Icon(
                Icons.star_border,
                color: Colors.white,
                size: 38,
              ));
      });
    }

    getFeedBack() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Genial!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 29),
              ),
              content: Container(
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Gracias a tu opinión podremos realizar mejores trabajos",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 21),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Selecciona",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 17),
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
                                  onTap: () {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(widget.order.uid)
                                        .updateData({
                                      'stars': [
                                        true,
                                        false,
                                        false,
                                        false,
                                        false
                                      ],
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    !star1 ? Icons.star_border : Icons.star,
                                    color: Colors.amberAccent,
                                    size: 38,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(widget.order.uid)
                                        .updateData({
                                      'stars': [
                                        true,
                                        true,
                                        false,
                                        false,
                                        false
                                      ],
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    !star2 ? Icons.star_border : Icons.star,
                                    color: Colors.amberAccent,
                                    size: 38,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(widget.order.uid)
                                        .updateData({
                                      'stars': [true, true, true, false, false],
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    !star3 ? Icons.star_border : Icons.star,
                                    color: Colors.amberAccent,
                                    size: 38,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(widget.order.uid)
                                        .updateData({
                                      'stars': [true, true, true, true, false],
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    !star4 ? Icons.star_border : Icons.star,
                                    color: Colors.amberAccent,
                                    size: 38,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Firestore.instance
                                        .collection('orders')
                                        .document(widget.order.uid)
                                        .updateData({
                                      'stars': [true, true, true, true, true],
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    !star5 ? Icons.star_border : Icons.star,
                                    color: Colors.amberAccent,
                                    size: 38,
                                  ),
                                ),
                              ]),
                        ),
                      )
                    ],
                  )),

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
          });
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
                    child: Mapex(
                      order: widget.order,
                    ),
                  ),

                  ButtonGreen(
                    text: "Listo",
                    onPressed: () {
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

    Color setCOlor (){
      switch (widget.order.type) {
        case 'Manicura':
            return Color.fromRGBO(250, 208, 211, 1.8);
          break;
        case 'Pedicura':
            return Color.fromRGBO(250, 208, 211, 1.8);
          break;
        case 'Manicura y Pedicura':
            return Color.fromRGBO(243, 227, 249, 1.8);
          break;
        case 'Pestañas':
            return Color.fromRGBO(250, 208, 211, 1.8);
          break;
        case 'Masajes coorporales':
            return Color.fromRGBO(250, 203, 203, 1.8);
          break;
        case 'Cejas':
            return Color.fromRGBO(247, 213, 224, 1.8);
          break;
        default:
      }
    }
    
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (_) =>  Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              DelayedReveal(
                delay: Duration(milliseconds: 300),
                child: Container(
                  // width: SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 2.0))
                ],
                  ),
                  child: ListTile(
                    onTap: (){
                      _.goToDetails(widget.order);
                    },

                    // Fila de arriba
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Servicio - ',
                              style: TextStyle(
                                  color: Color(0xff66A6B7),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.order.state,
                              style: TextStyle(
                                  color: widget.order.state == 'Finalizado' ||
                                          widget.order.state == 'En proceso'
                                      ? Colors.redAccent
                                      : kceleste1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          'Fecha y hora',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff66A6B7),
                          ),
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.order.type.split(" ")[0]}...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          widget.order.recolectionStart,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    trailing: SvgPicture.asset(
                      'assets/icons/chevron-right.svg',
                      height: 20,
                      color: kceleste1,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                color: setCOlor(),
                borderRadius: BorderRadius.circular(10)

                ),
              ),
            ],
          )),
    );
  }
}
