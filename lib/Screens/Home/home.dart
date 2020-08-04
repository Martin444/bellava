
import 'dart:async';

import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Carreer/UI/CarrerPage.dart';
import 'package:bellava/Screens/Contact/UI/ContactPage.dart';

import 'package:bellava/Screens/Orders/UI/OrderPage.dart';
import 'package:bellava/Screens/Promociones/UI/PromocionesPage.dart';
import 'package:bellava/Screens/QuestionPage/UI/CuestionPage.dart';
import 'package:bellava/Screens/Services/Ui/ServicePage.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{



    List<ScreenHiddenDrawer> items =  List();
     bool star1 = false;
    bool star2 = false;
    bool star3 = false;
    bool star4 = false;
    bool star5 = false;


    @override
  void initState() {


    super.initState();

    
  }


  @override
  Widget build(BuildContext context) {



    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData || snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("No hay datos aun"),
            ),);
        }else{

         

        var user = User(
            uid: snapshot.data.uid,
            name: snapshot.data.displayName,
            email: snapshot.data.email,
            photoURL: snapshot.data.photoUrl,);
         
        getFeedBack(uidOrder){
        return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Genial!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 29
              ),
              ),
              content: Container(
                height: 180,
                child: 
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text("Gracias a tu opinión podremos realizar mejores trabajos",
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 21
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Selecciona",
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17
                          ),
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            
                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(uidOrder).updateData({
                                        'stars' : [
                                          true,
                                          false,
                                          false,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon( !star1 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(uidOrder).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          false,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star2 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(uidOrder).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          false,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star3 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(uidOrder).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          true,
                                          false
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star4 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),

                                InkWell(
                                  onTap: (){
                                      Firestore.instance.collection('orders').document(uidOrder).updateData({
                                        'stars' : [
                                          true,
                                          true,
                                          true,
                                          true,
                                          true
                                        ],
                                       
                                      });
                                      Navigator.pop(context);
                                  },
                                  child: Icon(!star5 ? Icons.star_border : Icons.star, color: Colors.amberAccent, size: 38,),
                                ),
                              ]
                            ),
                          ),
                        )
                    ],
                  )
            
              ),
            
              // actions: <Widget>[
              //   FlatButton(
              //     child: Text("Acepto"),
              //     onPressed: (){
              //       Firestore.instance.collection('orders').document(widget.order.uid).updateData({
              //         'state' : 'Aceptado',
              //         'profesional' : widget.user.uid
              //       });
              //       Navigator.pop(context);
              //       Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) =>
              //         new SuccessScreen()
              //       ));
              //     },
              //   )
              // ],
            
            );
          }
        );
      }

        _showStarAlert(){
             var result = Firestore.instance.collection('orders').where("userOwner", isEqualTo:user.uid).getDocuments();

              result.then((value) => {
                value.documents.forEach((element) { 
                  var stado = element.data['state'];
                  var stars = element.data['stars'];
                  var uidOrder = element.documentID;

                  if(stado == "Finalizado"){ 
                    if(stars == null){
                      getFeedBack(uidOrder);

                    }else {
                      print("Hola");
                    }
                  }
                })
              });
            
            }
          
        Timer(Duration(seconds: 5), (){
            _showStarAlert();
          });

        return Scaffold(
          body: HiddenDrawerMenu(
            backgroundColorMenu: korange,
            backgroundMenu: null,
            backgroundColorAppBar: Colors.white,
            backgroundColorContent: null,
            elevationAppBar: 0.0,
            screens: [
                ScreenHiddenDrawer(
                  new ItemHiddenMenu(
                    name: "Servicios",
                    baseStyle: TextStyle( color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w600 ),
                    colorLineSelected: Colors.teal,
                  ),
                  ServicePage(user)),

                  ScreenHiddenDrawer(
                    new ItemHiddenMenu(
                      name: "Mis Ordenes",
                      baseStyle: TextStyle( color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600 ),
                      colorLineSelected: Colors.orange,
                    ),
                    OrderPage(user)),

                    ScreenHiddenDrawer(
                      new ItemHiddenMenu(
                        name: "Promociones",
                        baseStyle: TextStyle( color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600 ),
                        colorLineSelected: Colors.orange,
                      ),
                      PromocionesPage()),

                      ScreenHiddenDrawer(
                        new ItemHiddenMenu(
                          name: "Preguntas Frecuentes",
                          baseStyle: TextStyle( color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600 ),
                          colorLineSelected: Colors.orange,
                        ),
                        CuestionPage()),

                        ScreenHiddenDrawer(
                          new ItemHiddenMenu(
                            name: "Quiero trabajar aqui!",
                            baseStyle: TextStyle( color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600 ),
                            colorLineSelected: Colors.orange,
                          ),
                          CarreerPage()
                          ),

                          ScreenHiddenDrawer(
                            new ItemHiddenMenu(
                              name: "Contactanos",
                              baseStyle: TextStyle( color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w600 ),
                              colorLineSelected: Colors.orange,
                            ),
                            ContactPage()
                            )
            ],
                 typeOpen: TypeOpen.FROM_LEFT,
                 enableScaleAnimin: false,
              //    enableCornerAnimin: true,
                 slidePercent: 70.0,
              //    verticalScalePercent: 80.0,
                 contentCornerRadius: 20.0,
                 iconMenuAppBar: Icon(Icons.clear_all, color: korange, size: 40,),
              //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
                 whithAutoTittleName: false,
              //    styleAutoTittleName: TextStyle(color: Colors.red),
              //    actionsAppBar: <Widget>[],
              //    backgroundColorContent: Colors.blue,
              //    elevationAppBar: 4.0,
                 tittleAppBar: Center(
                   child: Container(
                      // width: MediaQuery.of(context).size.width,
                     child: Container(
                       margin: EdgeInsets.only(right: 35, top: 10),
                       child: Image.asset('assets/logohead.png', fit: BoxFit.contain, scale: 20,) 
                       )
                      ),
                 ),
                 enableShadowItensMenu: false,
              //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
          ),
        );
       }
      
      }
    );
  }
}