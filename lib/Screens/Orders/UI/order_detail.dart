import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Orders/UI/feedback.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/controllers/Order_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbols.dart';

class OrderDetails extends StatelessWidget {
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (_) {
      List<Text> servs = new List<Text>();

      _.order.services.forEach((e) {
        e != null
            ? servs.add(Text(
                e,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Lato'),
              ))
            : null;
      });

      List<Icon> stars = new List<Icon>();

      _.order.stars != null
          ? _.order.stars.forEach((e) {
              e == true
                  ? stars.add(Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 24,
                    ))
                  : stars.add(Icon(
                      Icons.star_border,
                      color: Colors.blueGrey,
                      size: 24,
                    ));
            })
          : null;

      return Scaffold(
        body: Stack(
          children: [
            BackGradient(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // BarTop
                    Container(
                      width: Get.width,
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: 50,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Plan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 35,
                              height: 35,
                              // color: Colors.redAccent,
                              child: SvgPicture.asset(
                                'assets/icons/arrow-narrow-left.svg',
                                alignment: AlignmentDirectional.centerStart,
                                // fit: BoxFit.none,
                                height: 30,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(height: 10),
                    _.order.profesionalID != null
                        ? Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tu Profesional asignado es',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                // SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin:
                                          EdgeInsets.only(right: 10, top: 10),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://static.dribbble.com/users/460298/screenshots/4289309/nick0_copy.jpg'),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            _.order.profesionalName,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          // height: 30,
                                          alignment: Alignment.topCenter,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: stars,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                      ],
                                    )
                                  ],
                                ),

                                Container(
                                  height: 49,
                                  width: 100,
                                  child: ButtonPurple(
                                    buttonText: 'Calificar',
                                    onPressed: () {
                                      Get.to(FeedBack());
                                    },
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          )
                        : Container(),

                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          // Estado y total a pagar
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Estado del pedido',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _.order.state,
                                    style: TextStyle(
                                        color: _.order.state == 'Finalizado' ||
                                                _.order.state == 'En proceso'
                                            ? Colors.redAccent
                                            : kceleste1,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Total a pagar',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${_.order.price} Pesos',
                                    style: TextStyle(
                                        color: kgreenPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21),
                                  )
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          // Horario Flexxible
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '¿Acepta horario flexible?',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    _.order.flexible ? 'Si' : 'No',
                                    style: TextStyle(
                                        color: kgreenPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21),
                                  )
                                ],
                              ),
                            ],
                          ),

                          // Metodo de pago
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Metodo de pago',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: Get.width - 30,
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF0FBFE),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            _.order.typePayment == 'Efectivo'
                                                ? 'assets/icons/cash.svg'
                                                : 'assets/icons/credit-card.svg',
                                            color: kceleste1),
                                        SizedBox(width: 10),
                                        Text(
                                          _.order.typePayment,
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 21),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),

                          // Detalles del pedido
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detalles del pedido',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              _.order.services.length >= 1
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left:5, right: 10),
                                            child: SvgPicture.asset(
                                                'assets/icons/clipboard-list.svg',
                                                color: kceleste1),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Servicios',
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Lato'),
                                              ),
                                              Container(
                                                width: Get.width - 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: servs,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: <Widget>[],
                                    ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:5, right: 10),
                                    child: SvgPicture.asset(
                                        'assets/icons/calendar.svg',
                                        color: kceleste1),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Dia y Hora',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Lato"),
                                      ),
                                      Text(
                                        '${_.order.recolectionStart}',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Lato"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:5, right: 10),
                                    child: SvgPicture.asset(
                                        'assets/icons/location-marker.svg',
                                        color: kceleste1),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Ubicación',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Lato"),
                                      ),
                                      Container(
                                        width: Get.width - 70,
                                        child: Text(
                                          '${_.order.direction}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lato"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:5, right: 10),
                                    child: SvgPicture.asset(
                                        'assets/icons/home.svg',
                                        color: kceleste1),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Tipo de vivienda',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Lato"),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          '${_.order.typeHouse}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lato"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left:5, right: 10),
                                    child: SvgPicture.asset(
                                        'assets/icons/phone.svg',
                                        color: kceleste1),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Número de teléfono',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Lato"),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          '${_.order.numberPhone}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lato"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
