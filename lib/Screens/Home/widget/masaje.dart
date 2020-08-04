import 'package:bellava/Models/formInfo.dart';
import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Delivery/UI/DeliveryPage.dart';
import 'package:bellava/Screens/Services/widgets/bar_top.dart';
import 'package:bellava/Screens/Services/widgets/button_next.dart';
import 'package:bellava/Utils/anim/delayed_reveal.dart';
import 'package:flutter/material.dart';
import 'CardCategory.dart';

class Masaje extends StatefulWidget {
  User user;

  Masaje(this.user);
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
                             "Masajes descontracturantes de 30 Minutos"
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
                             "Masajes descontracturantes de 60 Minutos"
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
                    Container(
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