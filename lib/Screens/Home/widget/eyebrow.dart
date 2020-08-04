import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';

import 'CardCategory.dart';

class Eyebrow extends StatefulWidget {
  User user;

  Eyebrow(this.user);
  @override
  _EyebrowState createState() => _EyebrowState();
}


class _EyebrowState extends State<Eyebrow> {

  // Variables de los precios para cejas
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
      int Total  = pTotal1 + pTotal2 + pTotal3 + pTotal4 + pTotal5 + pTotal6 + pTotal7;
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
                      // Cejas
                      CardCategory("Perfilado.", 
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
                      }, "Info"),
                      CardCategory("Perfilado con Henna", 
                      "${price2}", count2,  
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
                      }, "Info"),
                      CardCategory("Tinte cejas",  
                      "${price3}", count3,  
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
                      }, "Info"),
                      CardCategory("Sombreado efecto polvo", 
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
                      }, "Info"),
                      CardCategory("Microblading",  
                      "${price5}", count5,  
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
                      }, "Info"),
                      CardCategory("Microshading",  
                      "${price6}", count6,  
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
                      }, "Info"),
                      Container(
                        margin: EdgeInsets.only( bottom: 70),
                        child: CardCategory("Retoque Microblading/Microshading", 
                        "${price7}", count7,  
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
                                  count1 >= 1 ? "Perfilado: ${count1}" : null,
                                  count2 >= 1 ? "Perfilado con Henna: ${count2}" : null,
                                  count3 >= 1 ? "Tinte cejas: ${count3}" : null,
                                  count4 >= 1 ? "Sombreado efecto polvo: ${count4}" : null,
                                  count5 >= 1 ? "Microblading: ${count5}" : null,
                                  count6 >= 1 ? "Microshading: ${count6}" : null,
                                  count7 >= 1 ? "Retoque Microblading/Microshading: ${count7}" : null,
                                ],
                                price: Total,
                                type: 'Cejas'
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