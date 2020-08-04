import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';

import 'CardCategory.dart';

class Manicure extends StatefulWidget {
  User user;

  Manicure({this.user});
  @override
  _ManicureState createState() => _ManicureState();
}

class _ManicureState extends State<Manicure> {

  int price1 = 450;
  int price2 = 600;
  int price3 = 700;
  int price4 = 800;
  int price5 = 500;
  int price6 = 600;
  int price7 = 350;
  int price8 = 450;
  int price9 = 50;
  int price10 = 90;
  
  
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
  int Total  = pTotal1 + pTotal2 + pTotal3 + pTotal4 + pTotal5 + pTotal6 + pTotal7 + pTotal8 + pTotal9 + pTotal10;
    return Scaffold(
      appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                brightness: Brightness.light,
                iconTheme: IconThemeData(
                    color: Colors.black87
                ),
              ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              
              DelayedReveal(
                delay: Duration(milliseconds: 400),
                child: Container(
                  
                  child: ListView(
                    children: <Widget>[

                             CardCategory("Esmaltado Común", 
                                "${price1}", count1,  
                                (){
                                  if (count1 >= 0){
                                                setState(() {
                                                    count1 = count1+1;
                                                    pTotal1 = count1 * price1;
                                                  });
                                              }
                                }, 
                                (){
                                  if(count1 > 0){
                                                setState(() {
                                                    count1 = count1-1;
                                                    pTotal1 = count1 * price1;
                                                  });
                                              }
                                }, 
                                "Esmaltado Común"),
                            CardCategory("Esmaltado Semipermanente",
                                "${price2}",
                                count2,
                                (){
                                  if (count2 >= 0){
                                              setState(() {
                                                  count2 = count2+1;
                                                  pTotal2 = count2 * price2;
                                                });
                                            }
                                },
                                (){
                                    if(count2 > 0){
                                              setState(() {
                                                  count2 = count2-1;
                                                  pTotal2 = count2 * price2;
                                                });
                                            }
                                },
                                  "Esmaltado Semipermanente"),
                            CardCategory("Esculpidas (Gel o Acrílico) con esmalte común",
                              "${price3}",
                                count3, 
                                (){
                                  if (count3 >= 0){
                                              setState(() {
                                                  count3 = count3+1;
                                                  pTotal3 = count3 * price3;
                                                });
                                            }
                                },
                                (){
                                  if(count3 > 0){
                                              setState(() {
                                                  count3 = count3-1;
                                                  pTotal3 = count3 * price3;
                                                });
                                            }
                                },
                                "Esculpidas (Gel o Acrílico) con esmalte común"),
                            CardCategory("Esculpidas (Gel o Acrílico) con esmalte semi",
                              "${price4}", count4,
                              (){
                                  if (count4 >= 0){
                                              setState(() {
                                                  count4 = count4+1;
                                                  pTotal4 = count4 * price4;
                                                });
                                            }
                                },
                                (){
                                  if(count4 > 0){
                                              setState(() {
                                                  count4 = count4-1;
                                                  pTotal4 = count4 * price4;
                                                });
                                            }
                                },
                              "Esculpidas (Gel o Acrílico) con esmalte semi"),
                            CardCategory("Service de esculpidas con esmalte común",
                              "${price5}",
                                count5,
                                (){
                                  if (count5 >= 0){
                                              setState(() {
                                                  count5 = count5+1;
                                                  pTotal5 = count5 * price5;
                                                });
                                            }
                                },
                                (){
                                  if(count5 > 0){
                                              setState(() {
                                                  count5 = count5-1;
                                                  pTotal5 = count5 * price5;
                                                });
                                            }
                                },
                                "Service de esculpidas con esmalte común"),
                             CardCategory("Service de esculpidas con esmalte semi",
                              "${price6}", 
                              count6, 
                              (){
                                  if (count6 >= 0){
                                              setState(() {
                                                  count6 = count6+1;
                                                  pTotal6 = count6 * price6;
                                                });
                                            }
                                },
                                (){
                                  if(count6 > 0){
                                              setState(() {
                                                  count6 = count6-1;
                                                  pTotal6 = count6 * price6;
                                                });
                                            }
                                },
                              "Service de esculpidas con esmalte semi"),
                            CardCategory("Service de semi con esmalte común",  
                              "${price7}", 
                              count7,  
                              (){
                                  if (count7 >= 0){
                                              setState(() {
                                                  count7 = count7+1;
                                                  pTotal7 = count7 * price7;
                                                });
                                            }
                                },
                                (){
                                  if(count7 > 0){
                                              setState(() {
                                                  count7 = count7-1;
                                                  pTotal7 = count7 * price7;
                                                });
                                            }
                                },
                              "Service de semi con esmalte común "),
                             CardCategory("Service de semipermanente con esmalte semi",
                              "${price8}", 
                              count8,  
                              (){
                                  if (count8 >= 0){
                                              setState(() {
                                                  count8 = count8+1;
                                                  pTotal8 = count8 * price8;
                                                });
                                            }
                                },
                                (){
                                  if(count8 > 0){
                                              setState(() {
                                                  count8 = count8-1;
                                                  pTotal8 = count8 * price8;
                                                });
                                            }
                                },
                              "Service de semipermanente con esmalte semi"),
                             CardCategory("Decoración simple por uña", 
                              "${price9}", 
                              count9,  
                              (){
                                  if (count9 >= 0){
                                              setState(() {
                                                  count9 = count9+1;
                                                  pTotal9 = count9 * price9;
                                                });
                                            }
                                },
                                (){
                                  if(count9 > 0){
                                              setState(() {
                                                  count9 = count9-1;
                                                  pTotal9 = count9 * price9;
                                                });
                                            }
                                },
                              "Decoración simple por uña"),
                           Container(
                             margin: EdgeInsets.only(bottom: 70),
                             child: CardCategory("Decoración diseño por uña",  
                                "${price10}", 
                                count10,  
                                (){
                                    if (count10 >= 0){
                                                setState(() {
                                                    count10 = count10+1;
                                                    pTotal10 = count10 * price10;
                                                  });
                                              }
                                  },
                                  (){
                                    if(count10 > 0){
                                                setState(() {
                                                    count10 = count10-1;
                                                    pTotal10 = count10 * price10;
                                                  });
                                              }
                                  },
                                "Decoración diseño por uña."),
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
                        iconData: Total > 0 ? Icons.arrow_forward : Icons.keyboard_arrow_left,
                        onChanged: (){

                          Navigator.pop(context);
                        Total > 0 ?
                          Navigator.push(context, 
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
                                  count1 >= 1 ? "Esmaltado Común: ${count1}" : null,
                                  count2 >= 1 ? "Esmaltado Semipermanente: ${count2}" : null,
                                  count3 >= 1 ? "Esculpidas (Gel o Acrílico) con esmalte común: ${count3}" : null,
                                  count4 >= 1 ? "Esculpidas (Gel o Acrílico) con esmalte semi: ${count4}" : null,
                                  count5 >= 1 ? "Service de esculpidas con esmalte común: ${count5}" : null,
                                  count6 >= 1 ? "Service de esculpidas con esmalte semi: ${count6}" : null,
                                  count7 >= 1 ? "Service de semi con esmalte común: ${count7}" : null,
                                  count8 >= 1 ? "Service de semipermanente con esmalte semi: ${count8}" : null,
                                  count9 >= 1 ? "Decoración simple por uña: ${count8}" : null,
                                  count10 >= 1 ? "Decoración diseño por uña: ${count10}" : null,
                                ],
                                price: Total,
                                type: 'Manicura'
                              )
                          );
                          })
                          )

                        :

                          print("No se puede");
                      },
                      
                      ),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(22))
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            Text("${Total} Pesos",
                             style: TextStyle(color: Colors.black54, fontSize: 30,)
                            ),
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