import 'dart:async';

import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Carreer/UI/CarrerPage.dart';
import 'package:bellava/Screens/Contact/UI/ContactPage.dart';
import 'package:bellava/Screens/Home/widget/profileHeader.dart';

import 'package:bellava/Screens/Orders/UI/OrderPage.dart';
import 'package:bellava/Screens/Promociones/UI/PromocionesPage.dart';
import 'package:bellava/Screens/QuestionPage/UI/CuestionPage.dart';
import 'package:bellava/Screens/Services/Ui/ServicePage.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
    var servi = Get.find<ServiceController>();


    @override
  void initState() {
    super.initState();

    // servi.setDataUser();
  }
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ServicePage();
  int currentTab = 3; //

  List<ScreenHiddenDrawer> items = List();
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ServiceController>(
      init: ServiceController(),
      builder: (_) => StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: LinearProgressIndicator(),
                ),
              );
            } else {

                _.setDataUser();
              
              
              return Scaffold(
                bottomNavigationBar: BottomAppBar(
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = PromocionesPage();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/speakerphone.svg',
                                  color:  currentTab == 0 ? kceleste1 : Color(0XFF22383D)
                                  ),
                              currentTab == 0 ?
                              Text(
                                'Prom.',
                                style: TextStyle(
                                  color:  currentTab == 0 ? kceleste1 : Color(0XFF22383D)
                                ),
                              )
                              :
                              Container()
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = OrderPage();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/shopping-cart.svg',
                                  color:  currentTab == 1 ? kceleste1 : Color(0XFF22383D)
                                  ),
                              currentTab == 1 ?
                              Text(
                                'Ordenes',
                                style: TextStyle(
                                  color:  currentTab == 1 ? kceleste1 : Color(0XFF22383D)
                                ),
                              )
                              :
                              Container()
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = ServicePage();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/home.svg',
                                  color:  currentTab == 3 ? kceleste1 : Color(0XFF22383D)
                                  ),
                              currentTab == 3 ?

                              Text(
                                'Inicio',
                                style: TextStyle(
                                  color:  currentTab == 3 ? kceleste1 : Color(0XFF22383D)
                                ),
                              )
                              :
                              Container()
                            ],
                          ),
                        ),

                        // Right Tab bar icons

                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = ProfileHeader();
                              currentTab = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/user-circle.svg',
                                  color:  currentTab == 4 ? kceleste1 : Color(0XFF22383D)
                                  ),
                              currentTab == 4 ?
                              Text(
                                'Perfil',
                                style: TextStyle(
                                  color:  currentTab == 4 ? kceleste1 : Color(0XFF22383D)
                                ),
                              )

                              :
                              Container()
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = CuestionPage();
                              currentTab = 5;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/question-mark-circle.svg',
                                  color:  currentTab == 5 ? kceleste1 : Color(0XFF22383D)
                                  ),
                              currentTab == 5 ?
                              Text(
                                'FAQ',
                                style: TextStyle(
                                  color:  currentTab == 5 ? kceleste1 : Color(0XFF22383D)
                                ),
                              )
                              : Container()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                body: PageStorage(
                  child: currentScreen,
                  bucket: bucket,
                ),
              );
             
            }
          }),
    );
  }
}
