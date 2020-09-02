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

class Masaje extends StatefulWidget {

  @override
  _MasajeState createState() => _MasajeState();
}


class _MasajeState extends State<Masaje> {


  int priceOne = 650;
  int pricetwo = 850;
  int countOne = 0;
  int countTwo = 0;

  int pMasaje3 = 0;
  int pMasaje6 = 0;

  @override
  Widget build(BuildContext context) {
  int Total = pMasaje3 + pMasaje6;
    return GetBuilder<ServiceController>(
      builder: (_) =>Scaffold(
        
        body: SafeArea(
          child: Container(
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
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: opacityCeleste1,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(_.url))),
                          child: Center(
                            child: Text(
                              'Masajes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        
                        CardCategory(
                            "Masajes desc 30 min",
                             "${priceOne}", countOne,
                               (){
                                 if (countOne >= 0){
                                  setState(() {
                                      countOne = countOne+1;
                                      pMasaje3 = countOne * priceOne;
                                    });
                                 }
                               }, 
                               (){
                                 if(countOne > 0){
                                  setState(() {
                                      countOne = countOne-1;
                                      pMasaje3 = countOne * priceOne;
                                    });
                                 }
                               },
                               'Relaja los músculos aliviando las tensiones que pueden producir en ellos el estrés, la falta de descanso o las malas posturas.Duración: 30 Minutos'
                               ),
                         CardCategory(
                            "Masajes desc 60 min", 
                            "${pricetwo}", 
                            countTwo,  
                            (){
                                if (countTwo >= 0){
                                  setState(() {
                                      countTwo = countTwo+1;
                                      pMasaje6 = countTwo * pricetwo;
                                    });
                                 }
                               }, 
                               (){
                                 if (countTwo > 0){
                                  setState(() {
                                      countTwo = countTwo-1;
                                      pMasaje6 = countTwo * pricetwo;
                                    });
                                 }
                               },
                               'Relaja los músculos aliviando las tensiones que pueden producir en ellos el estrés, la falta de descanso o las malas posturas.Duración: 1 Hs'
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
                  height: 95,
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
                                    countOne >= 1 ? "Masaje descontracturante de 30 minutos: ${countOne}" : null,
                                    countTwo >= 1 ? "Masaje descontracturante de 60 minutos: ${countTwo}" : null
                                  ],
                                  price: Total,
                                  type: 'Masajes coorporales'
                                )
                            );
                            })
                            )

                          :

                            Navigator.pop(context);
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