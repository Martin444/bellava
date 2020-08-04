import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';

import 'CardCategory.dart';

class FaceTabs extends StatefulWidget {
  User user;

  FaceTabs(this.user);
  @override
  _FaceTabsState createState() => _FaceTabsState();
}

class _FaceTabsState extends State<FaceTabs> {
  int countEsmaltadoC = 0;
  // Variables de los precios de las pestañas
  int price1 = 650;
  int price2 = 750;
  int price3 = 850;
  int price4 = 900;
  int price5 = 950;
  int price6 = 1000;
  int price7 = 950;
  int price8 = 400;
  int price9 = 450;
  int price10 = 550;
  int price11 = 650;
  int price12 = 700;
  int price13 = 750;
  int price14 = 800;
  int price15 = 750;
  int price16 = 700;
  int price17 = 900;
  int price18 = 300;

  // Variables de los contadores de las pestañas

  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
  int count8 = 0;
  int count9 = 0;
  int count10 = 0;
  int count11 = 0;
  int count12 = 0;
  int count13 = 0;
  int count14 = 0;
  int count15 = 0;
  int count16 = 0;
  int count17 = 0;
  int count18 = 0;

  // Variables del precio total de las pestañas

  int pTotal1 = 0;
  int pTotal2 = 0;
  int pTotal3 = 0;
  int pTotal4 = 0;
  int pTotal5 = 0;
  int pTotal6 = 0;
  int pTotal7 = 0;
  int pTotal8 = 0;
  int pTotal9 = 0;
  int pTotal10 = 0;
  int pTotal11 = 0;
  int pTotal12 = 0;
  int pTotal13 = 0;
  int pTotal14 = 0;
  int pTotal15 = 0;
  int pTotal16 = 0;
  int pTotal17 = 0;
  int pTotal18 = 0;

  @override
  Widget build(BuildContext context) {
    int Total = pTotal1 +
        pTotal2 +
        pTotal3 +
        pTotal4 +
        pTotal5 +
        pTotal6 +
        pTotal7 +
        pTotal8 +
        pTotal9 +
        pTotal10 +
        pTotal11 +
        pTotal12 +
        pTotal13 +
        pTotal14 +
        pTotal15 +
        pTotal16 +
        pTotal17 +
        pTotal18;

    return Scaffold(
      appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                brightness: Brightness.light,
                iconTheme: IconThemeData(
                    color: Colors.black87
                ),
              ),
      body: Container(
        child: DelayedReveal(
          delay: Duration(milliseconds: 400),
          child: Stack(
            children: <Widget>[
             
              DelayedReveal(
                delay: Duration(milliseconds: 400),
                child: Container(
                  child: ListView(
                    children: <Widget>[

                      CardCategory(
                          "Pestañas pelo por pelo", "${price1}", count1, () {
                        if (count1 >= 0) {
                          setState(() {
                            count1 = count1 + 1;
                            pTotal1 = count1 * price1;
                          });
                        }
                      }, () {
                        if (count1 > 0) {
                          setState(() {
                            count1 = count1 - 1;
                            pTotal1 = count1 * price1;
                          });
                        }
                      }, "Info"),
                      CardCategory(
                          "Pestañas pelo por pelo 2D", "${price2}", count2, () {
                        if (count2 >= 0) {
                          setState(() {
                            count2 = count2 + 1;
                            pTotal2 = count2 * price2;
                          });
                        }
                      }, () {
                        if (count2 > 0) {
                          setState(() {
                            count2 = count2 - 1;
                            pTotal2 = count2 * price2;
                          });
                        }
                      }, "INfo"),
                      CardCategory(
                          "Pestañas pelo por pelo 3D", "${price3}", count3, () {
                        if (count3 >= 0) {
                          setState(() {
                            count3 = count3 + 1;
                            pTotal3 = count3 * price3;
                          });
                        }
                      }, () {
                        if (count3 > 0) {
                          setState(() {
                            count3 = count3 - 1;
                            pTotal3 = count3 * price3;
                          });
                        }
                      }, "INfo"),
                      CardCategory(
                          "Pestañas pelo por pelo 4D", "${price4}", count4, () {
                        if (count4 >= 0) {
                          setState(() {
                            count4 = count4 + 1;
                            pTotal4 = count4 * price4;
                          });
                        }
                      }, () {
                        if (count4 > 0) {
                          setState(() {
                            count4 = count4 - 1;
                            pTotal4 = count4 * price4;
                          });
                        }
                      }, "INfo"),
                      CardCategory(
                          "Pestañas pelo por pelo 5D", "${price5}", count5, () {
                        if (count5 >= 0) {
                          setState(() {
                            count5 = count5 + 1;
                            pTotal5 = count5 * price5;
                          });
                        }
                      }, () {
                        if (count5 > 0) {
                          setState(() {
                            count5 = count5 - 1;
                            pTotal5 = count5 * price5;
                          });
                        }
                      }, "Info"),
                      CardCategory(
                          "Pestañas pelo por pelo 6D", "${price6}", count6, () {
                        if (count6 >= 0) {
                          setState(() {
                            count6 = count6 + 1;
                            pTotal6 = count6 * price6;
                          });
                        }
                      }, () {
                        if (count6 > 0) {
                          setState(() {
                            count6 = count6 - 1;
                            pTotal6 = count6 * price6;
                          });
                        }
                      }, "Info"),
                      CardCategory(
                          "Extensión pestaña Vol. Ruso", "${price7}", count7,
                          () {
                        if (count7 >= 0) {
                          setState(() {
                            count7 = count7 + 1;
                            pTotal7 = count7 * price7;
                          });
                        }
                      }, () {
                        if (count7 > 0) {
                          setState(() {
                            count7 = count7 - 1;
                            pTotal7 = count7 * price7;
                          });
                        }
                      }, "Info"),
                      CardCategory(
                          "Extracción de pestañas", "${price8}", count8, () {
                        if (count8 >= 0) {
                          setState(() {
                            count8 = count8 + 1;
                            pTotal8 = count8 * price8;
                          });
                        }
                      }, () {
                        if (count8 > 0) {
                          setState(() {
                            count8 = count8 - 1;
                            pTotal8 = count8 * price8;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service de pestañas pelo por pelo",
                          "${price9}", count9, () {
                        if (count9 >= 0) {
                          setState(() {
                            count9 = count9 + 1;
                            pTotal9 = count9 * price9;
                          });
                        }
                      }, () {
                        if (count9 > 0) {
                          setState(() {
                            count9 = count9 - 1;
                            pTotal9 = count9 * price9;
                          });
                        }
                      }, "info"),
                      CardCategory("Service pestañas pelo por pelo 2D",
                          "${price10}", count10, () {
                        if (count10 >= 0) {
                          setState(() {
                            count10 = count10 + 1;
                            pTotal10 = count10 * price10;
                          });
                        }
                      }, () {
                        if (count10 > 0) {
                          setState(() {
                            count10 = count10 - 1;
                            pTotal10 = count10 * price10;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service pestañas pelo por pelo 3D",
                          "${price11}", count11, () {
                        if (count11 >= 0) {
                          setState(() {
                            count11 = count11 + 1;
                            pTotal11 = count11 * price11;
                          });
                        }
                      }, () {
                        if (count11 > 0) {
                          setState(() {
                            count11 = count11 - 1;
                            pTotal11 = count11 * price11;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service pestañas pelo por pelo 4D",
                          "${price12}", count12, () {
                        if (count12 >= 0) {
                          setState(() {
                            count12 = count12 + 1;
                            pTotal12 = count12 * price12;
                          });
                        }
                      }, () {
                        if (count12 > 0) {
                          setState(() {
                            count12 = count12 - 1;
                            pTotal12 = count12 * price12;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service pestañas pelo por pelo 5D",
                          "${price13}", count13, () {
                        if (count10 >= 0) {
                          setState(() {
                            count13 = count13 + 1;
                            pTotal13 = count13 * price13;
                          });
                        }
                      }, () {
                        if (count10 > 0) {
                          setState(() {
                            count13 = count13 - 1;
                            pTotal13 = count13 * price13;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service pestañas pelo por pelo 6D",
                          "${price14}", count14, () {
                        if (count14 >= 0) {
                          setState(() {
                            count14 = count14 + 1;
                            pTotal14 = count14 * price14;
                          });
                        }
                      }, () {
                        if (count14 > 0) {
                          setState(() {
                            count14 = count14 - 1;
                            pTotal14 = count14 * price14;
                          });
                        }
                      }, "Info"),
                      CardCategory("Service Vol. Ruso", "${price15}", count15,
                          () {
                        if (count15 >= 0) {
                          setState(() {
                            count15 = count15 + 1;
                            pTotal15 = count15 * price15;
                          });
                        }
                      }, () {
                        if (count15 > 0) {
                          setState(() {
                            count15 = count15 - 1;
                            pTotal15 = count15 * price15;
                          });
                        }
                      }, "Info"),
                      CardCategory("Lifting", "${price16}", count16, () {
                        if (count16 >= 0) {
                          setState(() {
                            count16 = count16 + 1;
                            pTotal16 = count16 * price16;
                          });
                        }
                      }, () {
                        if (count16 > 0) {
                          setState(() {
                            count16 = count16 - 1;
                            pTotal16 = count16 * price16;
                          });
                        }
                      }, "Info"),
                      CardCategory("Lifting con tintura", "${price17}", count17,
                          () {
                        if (count17 >= 0) {
                          setState(() {
                            count17 = count17 + 1;
                            pTotal17 = count17 * price17;
                          });
                        }
                      }, () {
                        if (count17 > 0) {
                          setState(() {
                            count17 = count17 - 1;
                            pTotal17 = count17 * price17;
                          });
                        }
                      }, "Info"),
                      Container(
                        margin: EdgeInsets.only(bottom: 70),
                        child: CardCategory("Tinte de pestañas", "${price18}", count18,
                            () {
                          if (count18 >= 0) {
                            setState(() {
                              count18 = count18 + 1;
                              pTotal18 = count18 * price18;
                            });
                          }
                        }, () {
                          if (count18 > 0) {
                            setState(() {
                              count18 = count18 - 1;
                              pTotal18 = count18 * price18;
                            });
                          }
                        }, "Info"),
                      ),
                    
                    
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                padding: EdgeInsets.only(
                  top: 0,
                ),
                duration: Duration(seconds: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatNext(
                      iconData: Total > 0
                          ? Icons.arrow_forward
                          : Icons.keyboard_arrow_left,
                      onChanged: () {
                        Navigator.pop(context);
                        Total > 0
                            ? Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                                return DeliveryPage(
                                    user: widget.user,
                                    form: FormInfo(
                                        fecha: "",
                                        descripcion: "",
                                        flexible: false,
                                        calle: "",
                                        barrio: "",
                                        vivienda: "",
                                        numeroTelefono: "",
                                        services: [
                                          count1 >= 1
                                              ? "Pestañas pelo por pelo: ${count1}"
                                              : null,
                                          count2 >= 1
                                              ? "Pestañas pelo por pelo 2D: ${count2}"
                                              : null,
                                          count3 >= 1
                                              ? "Pestañas pelo por pelo 3D: ${count3}"
                                              : null,
                                          count4 >= 1
                                              ? "Pestañas pelo por pelo 4D: ${count4}"
                                              : null,
                                          count5 >= 1
                                              ? "Pestañas pelo por pelo 5D: ${count5}"
                                              : null,
                                          count6 >= 1
                                              ? "Pestañas pelo por pelo 6D: ${count6}"
                                              : null,
                                          count7 >= 1
                                              ? "Extensión pestaña Vol. Ruso: ${count7}"
                                              : null,
                                          count8 >= 1
                                              ? "Extracción de pestañas: ${count8}"
                                              : null,
                                          count9 >= 1
                                              ? "Service de pestañas pelo por pelo: ${count8}"
                                              : null,
                                          count10 >= 1
                                              ? "Service pestañas pelo por pelo 2D.: ${count10}"
                                              : null,
                                          count11 >= 1
                                              ? "Service pestañas pelo por pelo 3D.: ${count11}"
                                              : null,
                                          count12 >= 1
                                              ? "Service pestañas pelo por pelo 4D.: ${count12}"
                                              : null,
                                          count13 >= 1
                                              ? "Service pestañas pelo por pelo 5D.: ${count13}"
                                              : null,
                                          count14 >= 1
                                              ? "Service pestañas pelo por pelo 6D.: ${count14}"
                                              : null,
                                          count15 >= 1
                                              ? "Service Vol. Ruso: ${count15}"
                                              : null,
                                          count16 >= 1
                                              ? "Lifting: ${count16}"
                                              : null,
                                          count17 >= 1
                                              ? "Lifting con tintura: ${count17}"
                                              : null,
                                          count18 >= 1
                                              ? "Tinte de pestañas: ${count18}"
                                              : null,
                                        ],
                                        price: Total,
                                        type: 'Pestañas'));
                              }))
                            : print("No se puede");
                      },
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22))),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            Text("${Total} Pesos",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 30,
                                )),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
