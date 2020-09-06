import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CardCategory.dart';

class Pedicure extends StatefulWidget {
  // User user;

  // Pedicure(this.user);
  @override
  _PedicureState createState() => _PedicureState();
}

class _PedicureState extends State<Pedicure> {
  int countEsmaltadoC = 0;
  // Variables de los precios
  int price1 = 600;
  int price2 = 780;
  int price3 = 800;
  int price4 = 950;
  int price5 = 500;
  int price6 = 600;
  int price7 = 450;
  int price8 = 550;
  int price9 = 60;
  int price10 = 90;
  int price11 = 450;

  // Variables de los contadores

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

  // Variables del precio total

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
        pTotal10;

    return GetBuilder<ServiceController>(
      builder: (_)=> Scaffold(
        body: SafeArea(
          child: DelayedReveal(
            delay: Duration(milliseconds: 400),
            child: Stack(
              children: <Widget>[
                BackGradient(),
                
                DelayedReveal(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 70),
                        Container(
                            width: Get.width,
                            height: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: opacityCeleste1,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(_.url))),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 227, 249, 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Pedicure',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        
                        CardCategory("Esmaltado Común", "${price1}", count1, () {
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
                        }, 'Más de 25 colores a disposición. Ideal para mantener tus uñas protegidas y prolijas. Duración del servicio: Aprox 50 Min'),
                        CardCategory(
                            "Esmaltado Semipermanente", "${price2}", count2, () {
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
                        }, 'Más de 25 colores a disposición. Ideal para mantener tus uñas protegidas y prolijas. Duración del servicio: Aprox 50 Min'),
                        CardCategory(
                            "Esculpidas (Gel o Acrílico) con esmalte común",
                            "${price3}",
                            count3, () {
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
                        }, 'Más de 25 colores a disposición. Perfectas para lucir unas uñas largas y finas durante largo tiempo. Duración del servicio: aprox 1:15 Hs'),
                        CardCategory(
                            "Esculpidas (Gel o Acrílico) con esmalte semi",
                            "${price4}",
                            count4, () {
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
                        }, 'Más de 25 colores a disposición. Perfectas para lucir unas uñas largas y finas. La base y el top coat harán que el esmaltado perdure y proteja tus uñas por mayor tiempo. Duración del servicio: aprox 1:15 Hs'),
                        CardCategory("Service de esculpidas con esmalte común",
                            "${price5}", count5, () {
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
                        }, 'Se realiza un limado y retoque de la uña en general para que permanezcan como nuevas. Duración del servicio: aprox 1 Hs'),
                        CardCategory("Service de esculpidas con esmalte semi",
                            "${price6}", count6, () {
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
                        }, 'Se realiza un limado y retoque de la uña en general para que permanezcan como nuevas. Duración del servicio: aprox 1 Hs'),
                        CardCategory("Service de semi con esmalte común",
                            "${price7}", count7, () {
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
                        }, 'Se realiza un limado y retoque de la uña en general para que permanezcan como nuevas. Duración del servicio: aprox 1 Hs'),
                        CardCategory("Service de semi con esmalte semi",
                            "${price8}", count8, () {
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
                        }, 'Se realiza un limado y retoque de la uña en general para que permanezcan como nuevas. Duración del servicio: aprox 1:15 Hs'),
                        CardCategory(
                            "Decoración simple por uña", "${price9}", count9, () {
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
                        }, ''),
                        Container(
                          margin: EdgeInsets.only(bottom: 80),
                          child: CardCategory(
                              "Decoración diseño por uña", "${price10}", count10,
                              () {
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
                          }, ''),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // BarTop
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: 90,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Servicio seleccionado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: FlatButton(
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                
                AnimatedContainer(
                  alignment: AlignmentDirectional.bottomCenter,
                  duration: Duration(seconds: 2),
                  child: Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(22))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Total a pagar',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700)),
                                Text('${Total} Pesos',
                                    style: TextStyle(
                                        color: Color(0xff77D499),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                          width: 190,
                          child: FloatNext(
                            text: 'Siguiente',
                            iconData: Icons.arrow_forward,
                            onChanged: () {
                              Navigator.pop(context);
                              Total > 0
                                  ? Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                      return DeliveryPage(
                                          // user: widget.user,
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
                                                    ? "Esmaltado Común: $count1"
                                                    : null,
                                                count2 >= 1
                                                    ? "Esmaltado Semipermanente: ${count2}"
                                                    : null,
                                                count3 >= 1
                                                    ? "Esculpidas (Gel o Acrílico) con esmalte común: ${count3}"
                                                    : null,
                                                count4 >= 1
                                                    ? "Esculpidas (Gel o Acrílico) con esmalte semi: ${count4}"
                                                    : null,
                                                count5 >= 1
                                                    ? "Service de esculpidas con esmalte común: ${count5}"
                                                    : null,
                                                count6 >= 1
                                                    ? "Service de esculpidas con esmalte semi: ${count6}"
                                                    : null,
                                                count7 >= 1
                                                    ? "Service de semi con esmalte común: ${count7}"
                                                    : null,
                                                count8 >= 1
                                                    ? "Service de semipermanente con esmalte semi: ${count8}"
                                                    : null,
                                                count9 >= 1
                                                    ? "Decoración simple por uña: ${count8}"
                                                    : null,
                                                count10 >= 1
                                                    ? "Decoración diseño por uña: ${count10}"
                                                    : null,
                                              ],
                                              price: Total,
                                              type: 'Pedicura'));
                                    }))
                                  : print("No se puede");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
