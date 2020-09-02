import 'package:bellava/Screens/Delivery/widget/button_purple.dart';
import 'package:bellava/Screens/Services/widgets/background.dart';
import 'package:bellava/Screens/controllers/Order_controller.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FeedBack extends StatelessWidget {
  var order = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            BackGradient(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // BarTop
                    Container(
                      width: Get.width,
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: 90,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Calificar servicio',
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

                    SizedBox(height: 30),
                    Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://static.dribbble.com/users/460298/screenshots/4289309/nick0_copy.jpg'),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '¿Qué te pareció el servicio de ${order.order.profesionalName}?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    _.selectStar(1);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: _.star >= 1
                                        ? Colors.amberAccent
                                        : Colors.grey,
                                    size: 33,
                                  )),
                              InkWell(
                                  onTap: () {
                                    _.selectStar(2);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: _.star >= 2
                                        ? Colors.amberAccent
                                        : Colors.grey,
                                    size: 33,
                                  )),
                              InkWell(
                                  onTap: () {
                                    _.selectStar(3);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: _.star >= 3
                                        ? Colors.amberAccent
                                        : Colors.grey,
                                    size: 33,
                                  )),
                              InkWell(
                                  onTap: () {
                                    _.selectStar(4);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: _.star >= 4
                                        ? Colors.amberAccent
                                        : Colors.grey,
                                    size: 33,
                                  )),
                              InkWell(
                                  onTap: () {
                                    _.selectStar(5);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: _.star >= 5
                                        ? Colors.amberAccent
                                        : Colors.grey,
                                    size: 33,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 49,
                          width: 100,
                          child: ButtonPurple(
                            buttonText: 'Calificar',
                            onPressed: () {
                              _.sendFeedback(order.order.uid);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
