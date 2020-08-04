import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';

import 'CardCategory.dart';

class ManiAndPedi extends StatefulWidget {
  User user;

  ManiAndPedi(this.user);
  @override
  _ManiAndPediState createState() => _ManiAndPediState();
}

class _ManiAndPediState extends State<ManiAndPedi> {

  // Variables de los precios
    int price1 = 1150;
    int price2 = 850;
    int price3 = 1500;
    int price4 = 1300;
    int price5 = 1200;
    int price6 = 1000;
    int price7 = 1000;
    int price8 = 1300;
    int price9 = 1150;
    int price10 = 50;
    int price11 = 90;

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
    int count11 = 0;

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
    int pTotal11 = 0;

  @override
  Widget build(BuildContext context) {
    int Total  = pTotal1 + pTotal2 + pTotal3 + pTotal4 + pTotal5 + pTotal6 + pTotal7 + pTotal8 + pTotal9 + pTotal10 + pTotal11;
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
                              CardCategory("Esmaltado Semipermanente", 
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
                              CardCategory("Esmaltado Común",  
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
                              CardCategory("Esculpidas manos y pies",  
                              "${price3}", count4,  
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
                              CardCategory("Esculpidas manos, semi pies",  
                              "${price4}",count5,  
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
                              CardCategory("Esculpidas manos, común pies",  
                              "${price5}",count6,  
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
                              CardCategory("Semipermanente manos, común pies",  
                              "${price6}",count7,  
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
                              CardCategory("Común manos, semi pies", 
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
                              CardCategory("Semi manos, esculpidas pies",
                              "${price8}",count8,  
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
                              }, "Info"),
                              CardCategory("Común manos, esculpidas pies", 
                              "${price9}",count9,  
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
                              }, "Info"),
                              CardCategory("Decoración simple por uña", 
                              "${price10}", count10,  
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
                              }, "Info"),
                              Container(
                                margin: EdgeInsets.only(bottom: 70),
                                child: CardCategory("Decoración diseño por uña", 
                                "${price11}", count11,  
                                (){
                                  if (count11 >= 0){
                                        setState(() {
                                            count11 = count11+1;
                                            pTotal11 = count11 * price11;
                                          });
                                      }
                                }, 
                                (){

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
                                  count1 >= 1 ? "Esmaltado Semipermanente: ${count1}" : null,
                                  count2 >= 1 ? "Esmaltado Común: ${count2}" : null,
                                  count3 >= 1 ? "Esculpidas manos y pies: ${count3}" : null,
                                  count4 >= 1 ? "Esculpidas manos, semi pies: ${count4}" : null,
                                  count5 >= 1 ? "Esculpidas manos, común pies: ${count5}" : null,
                                  count6 >= 1 ? "Semipermanente manos, común pies: ${count6}" : null,
                                  count7 >= 1 ? "Común manos, semi pies: ${count7}" : null,
                                  count8 >= 1 ? "Semi manos, esculpidas pies: ${count8}" : null,
                                  count9 >= 1 ? "Común manos, esculpidas pies: ${count8}" : null,
                                  count10 >= 1 ? "Decoración simple por uña: ${count10}" : null,
                                  count11 >= 1 ? "Decoración diseño por uña: ${count11}" : null,
                                ],
                                price: Total,
                                type: 'Manicura y Pedicura'
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