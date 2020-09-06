import 'package:bellava/Models/user.dart';
import 'package:bellava/Screens/Home/widget/header_profile.dart';
import 'package:bellava/Screens/Orders/widgets/allOrders.dart';
import 'package:bellava/Screens/Services/widgets/Covid_page.dart';
import 'package:bellava/Screens/Services/widgets/ListService.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/Services/widgets/list_service_api.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:bellava/provider/push_notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ServicePage extends StatefulWidget {
  // User user;

  // ServicePage(this.user);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      builder: (_) => Stack(
            children: <Widget>[
              BackGradient(),
              SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        HeaderProfile(),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){
                            Get.to(CovidPage());
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: opacityPink1,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text('Protocolos ante el Covid-19',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[200]
                              ),
                            )),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('¿Qué te quieres hacer hoy?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        ListServiceApi(),
                        SizedBox(height: 20),
                        Text('Tus próximos planes',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        AllOrders()
                      ],
                    ),
                  ),
                ),
              
              // ListService(widget.user),
            ],
          ),
    );
  }
}
