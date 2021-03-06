import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Screens/Delivery/UI/SelectHourProfesional.dart';
import 'package:bellava/Screens/Delivery/widget/SelectDateTime.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/CalendarCard.dart';
import 'package:bellava/Utils/button_green.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfesionalCard extends StatefulWidget {
  String userId;
  String userName;
  String userDescript;
  String userPhoto;
  dynamic userServicePhoto;
  FormInfo info;
  int totalPrice = 0;

  ProfesionalCard({
    @required this.userId,
    @required this.info,
    @required this.userName,
    @required this.userDescript,
    @required this.userPhoto,
    @required this.userServicePhoto,
  });
  @override
  _ProfesionalCardState createState() => _ProfesionalCardState();
}

class _ProfesionalCardState extends State<ProfesionalCard> {
  var userDatax = Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    var servis = <String>[];
    var count = <int>[];

    print(widget.userServicePhoto.runtimeType);
    // Creamos la lista de imagenes

    var image = <Container>[];

    widget.userServicePhoto.forEach((v) {
      image.add(
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network('$v'),
        ),
      );
    });

    for (var x = 0; x < widget.info.services.length; x++) {
      // print(widget.info.services[x]['name']);
      widget.info.services[x]['name'] != 't'
          ? servis.add(widget.info.services[x]['name'])
          : null;
      widget.info.services[x]['count'] != 0
          ? count.add(widget.info.services[x]['count'])
          : null;
    }

    switch (servis.length) {
      case 0:
        return Container(
          child: CircularProgressIndicator(),
        );
        break;

      default:
        return StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .document(widget.userId)
                .collection('services')
                .where('title', whereIn: servis)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var list = <String>[];
                var listservice = <Map>[];
                var priceLi = <int>[];

                for (var c = 0; c < snapshot.data.documents.length; c++) {
                  // var cal = snapshot.data.documents[c]['price'] * count[c];

                  // var lug = snapshot.data.documents[c]['title'].indexOf(servis);

                  // print(servis.);

                  list.add('${snapshot.data.documents[c]['title']}');
                  priceLi.add(snapshot.data.documents[c]['price']);

                  // print(priceLi);
                }

                var items = <Row>[];

                for (var d = 0; d < list.length; d++) {
                  // print(servis.indexOf(list[d]));
                  var indets = servis.indexOf(list[d]);

                  var prices = count[indets] * priceLi[d];

                  listservice.add({
                    'service': servis[indets],
                    'count': count[indets],
                    'price': prices
                  });

                  // print('${servis[indets]} x${count[indets]} ${prices}');

                  items.add(Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${servis[indets]}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          child: Row(children: [
                            Text(
                              '(x${count[indets]})',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${prices} pesos',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                        )
                      ]));
                }

                return GestureDetector(
                  onTap: () {
                    if (listservice.length != servis.length) {
                      Get.dialog(AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning_amber_outlined,
                              color: Colors.red,
                            ),
                            Text('Ups!')
                          ],
                        ),
                        content: Text(
                          'Algunos servicios de ${widget.userName.split(' ')[0]} no coinciden con los que pediste, ¿Deseas Continuar?',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 19, color: Colors.blueGrey),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  width: 80,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: kceleste1),
                                    ),
                                  ),
                                ),
                                color: opacityCeleste2,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: Colors.white,
                                child: Container(
                                  width: 100,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      'Continuar',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                color: Color(0xff77D499),
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                              ),
                            ],
                          )
                        ],
                      ));
                    } else {
                      // Sumar el total de todos los Servicios
                      for (var i = 0; i < listservice.length; i++) {
                        setState(() {
                          widget.totalPrice =
                              widget.totalPrice + listservice[i]['price'];
                        });
                      }
                      var infoSend = FormInfo(
                        fecha: '',
                        descripcion: null,
                        flexible: null,
                        calle: null,
                        barrio: null,
                        vivienda: null,
                        numeroTelefono: null,
                        services: listservice,
                        price: widget.totalPrice,
                        type: widget.info.type,
                      );
                      print(infoSend.services);
                      print(widget.totalPrice);

                      Get.to(DateSelect(
                        info: infoSend,
                        userId: widget.userId,
                        userName: widget.userName,
                      ));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 7.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.network(widget.userPhoto),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.userName}',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: opacityCeleste1,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'ver reviews',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 24,
                              )
                            ])
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            // horizontal: 10,
                          ),
                          child: Container(
                            child: Text(
                              widget.userDescript,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trabajos realizados',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: image,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }
            });
    }
  }
}
