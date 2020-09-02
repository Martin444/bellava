import 'package:bellava/Screens/Notifications/widget/notificationTiles.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Notifications extends StatefulWidget {

  
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var servi = Get.find<ServiceController>();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
    });
  }

  @override
  void dispose() {
    super.dispose();
    servi.notis.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      init: ServiceController(),
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              // BackGradient(),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height:30),
                      // BarTop
                      Container(
                        width: Get.width,
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width,
                              height: 70,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Notificaciones',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                width: 35,
                                height: 45,
                                // color: Colors.redAccent,
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-narrow-left.svg',
                                  alignment: AlignmentDirectional.centerStart,
                                  // fit: BoxFit.none,
                                  height: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    
                      Column(
                        children: _.notis,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
