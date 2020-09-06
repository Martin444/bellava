import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CardCategory.dart';

class Eyebrow extends StatefulWidget {

  @override
  _EyebrowState createState() => _EyebrowState();
}


class _EyebrowState extends State<Eyebrow> {

  // Variables de los precios para cejas
    int price1 = 650;
    int price2 = 750;
    int price3 = 450;
    int price4 = 2800;
    int price5 = 5000;
    int price6 = 5500;
    int price7 = 3500;
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
    return GetBuilder<ServiceController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: DelayedReveal(
            delay: Duration(milliseconds: 400),
            child: Stack(
              children: <Widget>[
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
                              color: Color.fromRGBO(247, 213, 224, 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Cejas',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        
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
                        }, 'Es un servicio de depilación que consiste en darle la forma correcta a tus cejas respetando siempre la forma natural de la misma.'),
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
                        }, 'La henna cuenta con componentes naturales que estimulan el crecimiento. Es ideal para cuando se tiene poco bello en las cejas'),
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
                        }, 'Aumenta el volumen y ofrece una sensación de cejas llenas.'),
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
                        }, 'Tratamiento semi permanente, que mejora y define la forma natural de las cejas con una aplicación de pigmento punto por punto.'),
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
                        }, 'Es una técnica de tatuaje semipermanente, pelo a pelo, que te permitirá lucir unas cejas perfectas y naturales, diseñadas según la forma de tu rostro'),
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
                        }, 'Es una técnica de corrección y relleno de cejas. Se logra un efecto sombreado y más intenso'),
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
                              padding: EdgeInsets.only(
                                   left: 20),
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

                          FloatNext(
                            text: 'Siguiente',
                            iconData:Icons.arrow_forward,
                            onChanged: (){

                              Navigator.pop(context);
                            Total > 0 ?
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (_) {
                                return DeliveryPage(
                                 
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