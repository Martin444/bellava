import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/Utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      init: ServiceController(),
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    // radius: 20.0,
                    backgroundImage: NetworkImage(_.user.photoURL ??
                        'https://static.dribbble.com/users/460298/screenshots/4289309/nick0_copy.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola,',
                      style: TextStyle(
                          color: Color(0xff446F7A) ,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                    // SizedBox(height: 3),
                    Text(
                      '${_.user.name.split(" ")[0]}!',
                      style: TextStyle(
                          color: Color(0xff66A6B7),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                _.goToNotifications();
              },
              child: Stack(
                alignment: Alignment(0.9, -1.0),
                children: [
                  SvgPicture.asset(
                    'assets/icons/bell.svg',
                    height: 28,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.red[300],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
